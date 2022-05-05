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
    imageLocOnCloud: {
        type: String,
    },
    likedUsers: [{
        type: mongoose.Schema.Types.ObjectId,
        ref: "User",
    }],
    owner: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "User",
    }
})

const Post = mongoose.model("Post", postSchema);

module.exports = Post;
