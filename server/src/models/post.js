
const mongoose = require("mongoose");
const router = require("../routers/post");

const postSchema = mongoose.Schema({
    userId:{
        type:String,
        required:true
    },
    desc:{
        type:String,
        max:500
    },
    img:{
        type:String,
    },
    likes:{
        type:Array,
        default:[],
    },
},
{timestamps: true }
);

module.exports = mongoose.model("Post", postSchema);

module.exports = router;