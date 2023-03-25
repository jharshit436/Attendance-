const router=require('express').Router();
const jwt=require("jsonwebtoken");
const { model } = require('mongoose');
const { findByIdAndDelete } = require('../models/dashboard_model');
const dashboardModel = require('../models/dashboard_model');
const dashboardmodel=require('../models/dashboard_model');
const userModel = require('../models/user_model');

router.get('/',async function(req,res){
    res.send("Hello");
})

router.get('/:UserId',async (req,res)=>{
    try{
        const email=req.params.UserId;
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
        console.log(subjectdata.body);
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
        console.log(newSubject);
    }catch(e){
        console.log("Error"+e);
    }
    
})

router.patch('/updateSubjectDetails/:id',async (req ,res)=>{
        try{
            const id=req.params.id;
            await dashboardModel.findByIdAndUpdate(id,req.body,function (err,docs){
                if(err){
                    console.log(err);
                }
                else{
                    res.send();
                }
            })
        }catch(e){
            console.log(e);
        }
})




router.delete('delete/:id',async function(req,res){
    try{
        const id=req.params.id;
        const result=await userModel.deleteOne
        
    }
    catch(e){
        console.log(e);
    }
})


module.exports=router;