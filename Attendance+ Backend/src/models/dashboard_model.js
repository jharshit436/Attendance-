const mongoose=require('mongoose');

const dashboardSchema=new mongoose.Schema(
    {
        UserId:{
            type: String,
            required: true, 
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
    }
);

const dashboardModel=mongoose.model("dashboard",dashboardSchema);
module.exports=dashboardModel;