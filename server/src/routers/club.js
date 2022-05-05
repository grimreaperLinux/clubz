const express = require("express");
const router = express.Router();
const Club = require("../models/club");
const Announcement = require("../models/announcement");
const clubAuth = require("../middleware/clubAuth");
const auth = require("../middleware/auth");

router.post("/newClub", auth, async (req, res) => {
    const club = new Club ({...req.body, owner: req.user._id});
    console.log(club)
    await club.save();
    res.status(200).send(club); 
})

router.post("/userjoinsclub", auth, async(req, res) => {
    try{
        const club = await Club.findById(req.club)
        club.members.push(req.user._id)
        await club.save()
        req.user.clubs.push(club._id)
        await req.user.save()
        res.status(200)
    } catch (e) {
        res.status(400).send(e)
    }
})

router.get("/getmembers", async(req, res) => {
    try {
        const club = await req.findById(req.clubid)
        if(club == null){
            res.status(400)
        }
        const clubusers = await club.populate('members')
        res.send(clubusers.members)
    } catch (e) {
        res.status(400)
    }
})

router.post("/announcement", clubAuth, async (req, res) => {
    const announcement = new Announcement ({...req.body, owner: req.club._id});
    await announcement.save();
    req.club.announcements.push(announcement._id);
    req.club.save()
    res.status(200).send(announcement);
})

router.get("/getClubAnnouncement/:clubid", async (req, res) => {
    const club = await Club.findById(req.params.clubid)
    const announces = await club.populate['announcements']
    res.send(announces.announcements)
})

router.get("/getUserannouncements", auth, async (req, res) => {
    const userclubs = req.user.populate('clubs')
    const clubslist = userclubs.clubs
    let announces;
    clubslist.forEach((club) => {
        clubposts = club.populate['announcements']
        announces.push(...clubposts.announcements)
    })
    res.send(announces)
})

router.patch("/removeuser/:id", clubAuth, async(req, res) => {
    const userid = req.params.id
    req.club.members.filter((member) => member != userid)
    req.club.save() 
})

router.get("/getclubs", async(req, res) => {
    const clubs = await Club.find({})
    res.send(clubs)
})

module.exports = router;