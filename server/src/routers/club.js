const express = require("express");
const router = express.Router();
const Club = require("../models/club");
const Announcement = require("../models/announcement");
const clubAuth = require("../middleware/clubAuth");
const auth = require("../middleware/auth");

router.post("/newClub", auth, async (req, res) => {
    const club = new Club ({...req.body, owner: req.user});
    await club.save();
    res.status(200).send(club); 
})

router.post("/getClub", clubAuth, async (req, res) => {
    res.status(200).send(req.club);
})

router.post("/announcement", clubAuth, async (req, res) => {
    const announcement = new Announcement ({...req.body, owner: req.club});
    await announcement.save();
    res.status(200).send(announcement);
})

router.get("/getAnnouncement", clubAuth, async (req, res) => {
    const announcement = await Announcement.findOne({owner: req.club._id});
    res.status(200).send(announcement);
})


module.exports = router;