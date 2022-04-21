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

module.exports = router;