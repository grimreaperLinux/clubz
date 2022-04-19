const express = require('express');
const router = express.Router();
const User = require("../models/user");
const club = require("../models/club");

//create an announcement
router.post("/", async (req, res)=>{
    const newAnnouncement = new Post(req.body)
    try{
        const savedAnnouncement = await newAnnouncement.save();
        res.status(200).json(savedAnnouncement)

    }catch(err){
        res.status(500).json(err)
    }
});


//delete an anouncement
router.delete("/:id", async  (req,res)=>{
    try{
        
        const post = await Post.findById(req.params.id);
        if(post.userId === req.body.userId){
            await post.deleteOne();
            res.status(200).json("the Announcement has been deleted")

        }else{
            res.status(403).json("you cant delete this annoiuncement")
        }
    } catch(err){
        res.status(500).json(err)
    }    
})

module.exports = router;
