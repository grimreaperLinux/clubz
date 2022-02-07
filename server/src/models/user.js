const mongoose = require("mongoose");
var validator = require("email-validator");

const userSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  email: {
    type: String,
    required: true,
    validate: function (value) {
      if (!validator.validate(value))
        throw new Error("Fuck this email. I want new one");
      return true;
    },
  },
  age: {
    type: Number,
    default: 0,
    validate: function (value) {
      if (value < 15) {
        throw new Error("Age must be over 15");
      }
      return true;
    },
  },
  College: {
    type: String,
    required: true,
  },
  Gender: {
    type: String,
    enum: ['Man','Woman','Non-Binary'],
  },
  Username: {
    type: String,
    required: true,
    trim: true,
  },
  profilepic:{
    data: Buffer,
    contentType: String,
  }
});

const User = mongoose.model("User", userSchema);

module.exports = User;
