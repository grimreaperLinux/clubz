const express = require("express");
const router = express.Router();
const User = require("../models/user");
const multer = require("multer");
const sharp = require("sharp");


router.post("/adduser", async function (req, res) {
  const user = new User(req.body);
  const token = await user.generateAuthToken(req.body.token);
  await user.save();
  res.status(200).send({ user, token });
});

router.get("/getLoggedInUser/:email", async (req, res) => {
  const useremail = req.params.email
  console.log(useremail)
  const user = await User.findOne({email: useremail})
  console.log(user);
  res.send(user).status(200)
})

router.get("/getusers", async function (req, res) {
  try {
      const users = await User.find({})
      res.send(users)
  } catch (e) {
      res.status(500).send()
  }
})

router.get("/getUser/:id", async(req, res) => {
  const user = await User.findById(req.params.id)
  res.send(user)
})

module.exports = router;