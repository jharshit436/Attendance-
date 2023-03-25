const mongoose=require('mongoose');

const dashboardSchema=new mongoose.Schema(
    {
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
            required:true
        }
    }
);

const dashboardModel=mongoose.model("dashboard",dashboardSchema);
module.exports=dashboardModel;