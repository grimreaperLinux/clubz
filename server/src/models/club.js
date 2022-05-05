const mongoose = require("mongoose");

const clubSchema = mongoose.Schema({
    owner: {
        type: mongoose.Schema.Types.ObjectId,
        required: true,
        ref: "User",
    },
    name:{
        type: String,
        required: true,
        trim: true
    },
    description: {
        type: String,
        required: true,
    },
    members: [{
        type: mongoose.Schema.Types.ObjectId,
        ref: "User",
    }],
    announcements: [{
        type: mongoose.Schema.Types.ObjectId,
        ref: "Announcement",
    }],
    profilepic: {
        type: String,
        required: true
    },
    type: {
        required: true,
        type: String
    }
})

const Club = mongoose.model("Club", clubSchema);

module.exports = Club;
