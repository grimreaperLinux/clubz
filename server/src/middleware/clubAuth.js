const User = require("../models/user");
const jwt = require("jsonwebtoken");
const Club = require("../models/club")

const clubAuth = async (req, res, next) => {
    try {
        const token = req.header("Authorization").replace("Bearer ", "");
        const decode = jwt.verify(token, "hehehe");
        const user = await User.findOne({_id: decode._id, "tokens.token": token})
        if(!user) {
            throw new Error();
        }
        const club = await Club.findOne({owner: decode._id})
        if(!club) {
            throw new Error();
        }
        req.user = user;
        req.club = club;
        next();
    } catch (e) {
        console.log(error);
        res.status(401).send({ error: "No Club associated with you!" }); 
    }
}

module.exports = clubAuth;