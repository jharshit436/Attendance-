const mongoose=require('mongoose');

const userSchema=new mongoose.Schema(
{
    userid:{
        type:String,
    },
    name:{
        type:String,
    },
    email:{
        type:String,
        unique:true,
    },
    password:{
        type:String,
    },
    addon:{
        type:Date,
        default:Date.now,
    }
}

);
const userModel=mongoose.model("user",userSchema);
module.exports=userModel;