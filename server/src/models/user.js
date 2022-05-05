const mongoose = require("mongoose");
const validator = require("email-validator");
const jwt = require('jsonwebtoken');

const userSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  email: {
    type: String,
    required: true,
    unique: true,
    validate: function (value) {
      if (!validator.validate(value))
        throw new Error("Wrong email. I want new one");
      return true;
    },
  },
  age: {
    type: Number,
    validate: function (value) {
      if (value < 15) {
        throw new Error("Age must be over 15");
      }
      return true;
    },
  },
  college: {
    type: String,
  },
  gender: {
    type: String,
    enum: ["Man", "Woman", "Non-Binary"],
  },
  username: {
    type: String,
    required: true,
    trim: true,
  },
  profilepic: {
    type: String,
  },
  clubs: [{
    type: mongoose.Schema.Types.ObjectId,
    ref: "Club",
  }],
  posts: [{
    type: mongoose.Schema.Types.ObjectId,
    ref: "Post",
  }],
  tokens: [
    {
      token: {
        type: String,
        required: true,
      },
    },
  ],
});

userSchema.methods.generateAuthToken = async function() { //this function is accessible to a instance of a model
  const user = this
  const token = jwt.sign({_id: user._id.toString()}, 'hehehe')
  user.tokens = user.tokens.concat({ token })
  await user.save()
  return token
}

const User = mongoose.model("User", userSchema);

module.exports = User;
