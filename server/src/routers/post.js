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

module.exports = router;