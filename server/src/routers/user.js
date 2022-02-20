const express = require('express')
const router = express.Router()
const User = require('../models/user')
const multer = require('multer')
const sharp = require('sharp')

router.post('/', async function (req, res) {
    const user = new User(req.body)
    await user.save()
    res.send('Fucking did it!!!!!!')
})

router.post('/newuser', multer().single('myFile'),async function(req, res){
    const user = new User({...req.body, profilepic: req.file.buffer})
    const token = await user.generateAuthToken()
    await user.save()
    const response = {
        token: token,
        user: user
    }
    console.log(user)
    res.send(response)
    res.status(200)
})

module.exports = router