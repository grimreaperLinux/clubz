const mongoose = require("mongoose");

const announcementSchema = mongoose.Schema(
  {
    owner: {
      type: mongoose.Schema.Types.ObjectId,
      required: true,
      ref: "Club",
    },
    title: {
      type: String,
      trim: true,
      default: "",
    },
    description: {
      type: String,
      required: true,
    },
    createdAt: {
      type: Date,
      default: Date.now(),
    },
  },
  {
    timeStamps: true,
  }
);

const announcement = mongoose.model("Announcement", announcementSchema);
module.exports = announcement;
