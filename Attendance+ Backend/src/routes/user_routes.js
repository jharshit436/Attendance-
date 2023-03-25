const router=require('express').Router();
const jwt=require("jsonwebtoken");
const userModel=require('../models/user_model');
const apikey=require('../apikeys');
const bcrypt=require('bcrypt');
router.get('/',(req,res)=>{
    res.send("Hello")
})

router.post('/createaccount', async (req,res)=>{
    try{
        const userData=req.body;
        console.log(userData);
        const password=userData.password;
        const salt=await bcrypt.genSalt(8);
        const hashedPassword=await bcrypt.hash(password,salt);
        userData.password=hashedPassword;
        const newUser=new userModel(userData);
        await newUser.save(function(err){
            if(err){
                res.status(400).json({success:false ,error: err})
                console.log(err);
            }
            res.status(200).json({
                success:true,
                data:newUser,
            })
        })
    }catch(e){
        console.log("error = "+e);
    }
})
router.get('/:id',async (req,res)=>{
    try{
        const id=req.params.UserId;
        const foundEmail = await userModel.findOne({ id: id });
        if(!foundEmail) {
            res.json({ success: false, error: "email-not-found" });
            return;
        }
        res.json(foundEmail);
    }catch(e){
        console.log("Error"+e);
    }
})

router.patch('/updateDetails/:id',async (req ,res)=>{
    try{
        const id=req.params.id;
        await userModel.findByIdAndUpdate(id,req.body,function (err,docs){
            if(err){
                console.log(err);
            }
            else{
                res.send(docs);
            }
        })
    }catch(e){
        console.log(e);
    }
})

router.post("/login",async function(req,res){
    const email=req.body.email;
    const password=req.body.password;

    const foundUser=await userModel.findOne({email:email});
    if(!foundUser){
        res.json({ success:false , error:"user not found"});
        return;
    }
    const correctPassword=await bcrypt.compare(password , foundUser.password);
    if(!correctPassword){
        res.status(401).json({ success:false,error:"incorrect password"});
        return;
    }

    var token=jwt.sign({email},"harshitJskkdkhkrkfhhkcfhfhk");
    console.log(req.body);
    console.log(token);
    res.json({token:token})
})

module.exports=router;