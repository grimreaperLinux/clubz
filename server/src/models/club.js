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
    motto: {
        type: String,
        default: "",
    },
    description: {
        type: String,
        required: true,
    }
})

const Club = mongoose.model("Club", clubSchema);

module.exports = Club;
