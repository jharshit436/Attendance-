const mongoose=require('mongoose');

const dashboardSchema=new mongoose.Schema(
    {
        id:{
            type:String,
        },
        UserId:{
            type: String, 
        },
        subject:{
            type:String,
        },
        totalclasses:{
            type:Number,
        },
        attendclasses:{
            type:Number,
        },
        email:{
            type:String,
            required:true,
        },
        __v:{
            type:Number,
        }
    }
);

const dashboardModel=mongoose.model("dashboard",dashboardSchema);
module.exports=dashboardModel;