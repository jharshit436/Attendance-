const express=require('express');
const mongoose=require('mongoose');
const bodyParser=require('body-parser');
const app=express();
const userRoutes=require('./routes/user_routes');
const dashbardRoutes=require('./routes/dashboard_routes');
const PORT=process.env.PORT||3000;
const jwt=require('jsonwebtoken');

app.use(bodyParser.json());

// Database Conection 
mongoose.connect('mongodb+srv://Developer:Harshit123@cluster0.qgbq7cs.mongodb.net/?retryWrites=true&w=majority').then(()=>{
    console.log('Database Connected ');
    })

//middleware
app.use("/api/user",userRoutes);
app.use("/api/dashboard",dashbardRoutes);

app.get("/",(req,res)=>{
    res.send("Ecommerce App"); 
})  


app.listen(PORT,"0.0.0.0",()=>{
    console.log("Server Started at port :- "+PORT);
})