module.exports = function(grunt){
    // Project configuration.
    grunt.initConfig({
	distFolder: 'dist',
	pkg: grunt.file.readJSON('package.json'),

	bowercopy: {
	    libs:{
		options:{
		    destPrefix: 'app/js/libs/'
		},
		files:{
		    'jquery.js': 'bower_components/jquery/dist/jquery.js',
		    'angular.js': 'bower_components/angular/angular.js',
		    'angular-ui-router.js': 'bower_components/angular-ui-router/release/angular-ui-router.js',
		    'angular-mocks.js': 'bower_components/angular-mocks/angular-mocks.js',
		    'bootstrap.js': 'bower_components/bootstrap/dist/js/bootstrap.js'
		}
	    },
	    css:{
		options:{ destPrefix: 'app/css' },
		files: {
		    'bootstrap.css': 'bower_components/bootstrap/dist/css/bootstrap.css'
		}
	    }
	},
	
	concat: {
	    options:{
		// specifies string that is inserted between concatenated files.
		separator: ';'
	    },
	    // dist is what is called target. TODO: add ** to pass trough recursevely
	    dist:{
		src: ['bower_components/angular/angular.js',
		      'bower_components/bootstrap/dist/js/boostrap.js',
		      'bower_components/jquery/dist/jquery.js',
		      'app/js/*.js'
		     ],
		dest: '<%= distFolder %>/main.js'
	    }
	},
	uglify:{
	    options: {
		banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
	    },
	    build: {
		src: '<%= distFolder %>/main.js',
		dest: '<%= distFolder %>/main.min.js'
	    }
	},
	// The connect task is used to serve static files with a local server.
	connect: {
	    client: {
		options: {
		    // The server's port, and the folder to serve from:
		    // Ex: localhost:9000, woucl serve up app/index.html
		    port: 9000,
		    base: 'app'
		}
	    },
	    server: {
		options:{
		    base: 'app',
		    port: 9000		 
		}
	    }
	},
	// The watch task is used to run tasks in response to file changes.
	watch: {
	    client: {
		files: ['app/**/*'],
		// In our case we do not configure any additional tasks,
		// since livereload is bulid into the watch task,
		// and since the browser refresh is handled by the snippet.
		// Any other task, like CoffeeScript goes here.
		tasks: [],
		options: {
		    livereload: true
		}
	    }
	}
    });

    // Load the plugin that provides the "uglify" task.
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-connect');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-bowercopy');
    // Default task(s).
    grunt.registerTask('default', ['bowercopy']);
    grunt.registerTask('build', ['concat', 'uglify']);
    grunt.registerTask('preview', ['connect:client', 'watch:client']);
};
