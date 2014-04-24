var Schema, User, mongoose, passportLocalMongoose;

mongoose = require('mongoose');

Schema = mongoose.Schema;

passportLocalMongoose = require('passport-local-mongoose');

User = new Schema({
  nickname: String,
  created_at: Date
});

User.plugin(passportLocalMongoose);

module.exports = mongoose.model("User", User);
