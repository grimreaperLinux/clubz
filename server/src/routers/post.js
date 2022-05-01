const express = require("express");
const router = express.Router();
const Post = require("../models/post");

router.post("/createpost", async function (req, res) {
    console.log('route hit')
    const post = new Post({ ...req.body});
    await post.save();
    console.log(post);
    res.send(post);
    res.status(200);
});

router.get("/getposts", async function (req, res) {
    try {
        const posts = await Post.find({})
        res.send(posts)
    } catch (e) {
        res.status(500).send()
    }
})

router.patch("/updatepost/:id", async function (req, res) {
    const updates = Object.keys(req.body)
    const allowedUpdates = ['location', 'caption', 'imageLocOnCloud', 'postpic']
    const isValidOperation = updates.every((update) => allowedUpdates.includes(update))

    if (!isValidOperation) {
        return res.status(400).send({ error: 'Invalid updates!' })
    }

    let post = await Post.findById(req.params.id)
    updates.forEach((update) =>  post[update] = req.body[update]) 
    await post.save()
    console.log(post)
    res.send(post)
})

router.delete("/deletepost/:id", async (req, res) => {
    const postid = req.params.id
    await Post.deleteOne({_id: postid})
    res.status(200)
})

module.exports = router;