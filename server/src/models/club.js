const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
    name:{
        type: String,
        required: true,
        trim: true
    },
    
})

const Club = mongoose.model("Club", clubSchema);

module.exports = Club;
