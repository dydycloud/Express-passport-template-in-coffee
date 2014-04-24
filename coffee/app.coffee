path 			= require('path')
express 		= require('express')
http 			= require('http')
mongoose 		= require('mongoose')
passport 		= require('passport')
LocalStrategy 	= require('passport-local').Strategy
configDB 		= require('./config/db.js')
port     		= process.env.PORT || 8080
app 			= express()
###
# Config
###
app.set('views', __dirname + '/views')
app.set('view engine', 'jade')
app.use(express.logger())
app.use(express.bodyParser())
app.use(express.methodOverride())

app.use(express.cookieParser('97117gwadaistheplace97120'))
app.use(express.session())

app.use(passport.initialize())
app.use(passport.session())

app.use(app.router)
app.use(express.static(path.join(__dirname, 'public')))

app.configure 'development', ()->
  app.use(express.errorHandler({ dumpExceptions: true, showStack: true }));


app.configure 'production', ()->
  app.use(express.errorHandler())

###
#Configure passport
###
User = require('./models/user');

passport.use(new LocalStrategy(User.authenticate()));

passport.serializeUser(User.serializeUser());
passport.deserializeUser(User.deserializeUser());

#Connect mongoose
mongoose.connect(configDB.url)

###
#Setup routes
###
require('./routes/routes')(app)

app.listen(port)
console.log('The magic happens on port ' + port)