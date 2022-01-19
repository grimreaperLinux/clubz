const express = require('express')
const router = express.Router()
const User = require('../models/user')

router.post('/', async function (req, res) {
    const user = new User(req.body)
    await user.save()
    res.send('Fucking did it!!!!!!')
})

module.exports = router