const router=require('express').Router();
const jwt=require("jsonwebtoken");
const dashboardModel = require('../models/dashboard_model');
const dashboardmodel=require('../models/dashboard_model');

router.get('/',async function(req,res){
    res.send("Hello");
})

router.get('/:email',async (req,res)=>{
    try{
        const email=req.params.email;
        const foundEmail = await dashboardModel.find({ email: email });
        if(!foundEmail) {
            res.json({ success: false, error: "email-not-found" });
            return;
        }
        res.json(foundEmail);

    }catch(e){
        console.log("Error"+e);
    }
})

router.post('/createsubject',async (req,res)=>{
   
    try{
        const subjectdata=req.body;
        const newSubject=new dashboardModel(subjectdata);
        await newSubject.save(function(err){
            if(err){
                res.status(400).json({success:false ,error: err})
                console.log(err);
            }
            res.status(200).json({
                success:true,
                data:newSubject,
            })
        })
        console.log(newSubject)
    }catch(e){
        console.log("Error"+e);
    }
    
})

module.exports=router;