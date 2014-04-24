// Gruntfile.js
module.exports = function (grunt) {
    // load all grunt tasks matching the `grunt-*` pattern
    require('load-grunt-tasks')(grunt);

    grunt.initConfig({
    	coffee: {
		  compile: {
		  	options: {
		      bare: true
		    },
		    files: {
		      'app.js': 'coffee/app.coffee',
		      'models/user.js': 'coffee/models/user.coffee',
		      'routes/routes.js': 'coffee/routes/routes.coffee',
		      'config/db.js': 'coffee/config/db.coffee'
		    }
		  }
		},
		watch: {
		  scripts: {
		    files: ['coffee/**/*.coffee'],
		    tasks: ['coffee'],
		    options: {
		      spawn: false,
		    },
		  },
		}
    });
    grunt.registerTask('default', ['watch']);
}
