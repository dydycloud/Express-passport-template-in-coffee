passport = require('passport')
User	 = require('../models/user')

module.exports = (app)->
  app.get '/', (req, res)->
    res.render 'index', { user : req.user}

  app.get '/register', (req, res)->
    res.render 'auth/register', { }

  app.post '/register', (req, res)->
    User.register new User(username : req.body.username), req.body.password,(err, user)->
      if err
        res.render 'register', (user : user)
      res.redirect '/'

  app.get '/login', (req, res)->
    res.render 'auth/login', (user : req.user)

  app.post '/login', passport.authenticate('local'), (req, res)->
    res.redirect '/'

  app.get '/logout', (req, res)->
    req.logout()
    res.redirect '/'
      