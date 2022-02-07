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

router.post('/uploadimg', multer().single('myFile'),async function(req, res){
    console.log(req.file)
    res.status(200)
})

module.exports = router