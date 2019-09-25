const express = require("express");
const multiparty  = require("multiparty");
const app = express();

app.get("/",(req,res)=>{
    res.send("good")
})

app.post("/upload",(req,res)=>{
    let form = new multiparty.Form()
    form.uploadDir = 'public/upload'
    form.parse(req,function(err,fields,files){
        let path = "/"+files.file[0].path
        res.json({"success":"ok","path":path})
    })
})


app.listen(3000)