const express = require("express");
const router = express.Router();
const Post = require("../models/post");
const auth = require("../middleware/auth");

router.post("/createpost", auth, async function (req, res) {
    const post = new Post({ ...req.body, });
    post.owner = req.user._id;
    await post.save();
    req.user.posts.push(post._id)
    await req.user.save()
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

router.patch("/updatepost/:id", auth, async function (req, res) {
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

router.delete("/deletepost/:id", auth, async (req, res) => {
    const postid = req.params.id
    await Post.deleteOne({_id: postid})
    const index = req.user.posts.indexOf(postid)
    req.user.posts.splice(index, 1)
    req.user.save()
    res.status(200)
})

router.patch('/likepost/:id', auth, async (req, res) => {
    console.log('Route is hit')
    const isliked = req.body.liked
    console.log(isliked)
    const post = await Post.findById(req.params.id)
    if(isliked){
        post.likedUsers.push(req.user._id)
    } else {
        const index = post.likedUsers.indexOf(req.user._id)
        post.likedUsers.splice(index, 1)
    }
    await post.save()
    console.log(post)
    res.send(post) 
})

module.exports = router;