const mongoose = require("mongoose");

const postSchema = mongoose.Schema({
    caption:{
        type: String,
        trim: true
    },
    location: {
        type: String,
        default: "",
    },
    postpic: {
        type: String,
    },
})

const Post = mongoose.model("Post", postSchema);

module.exports = Post;
