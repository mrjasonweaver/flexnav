/*global module:false*/
module.exports = function(grunt) {
	'use strict';

	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
		sass: {
			dist: {
				files: {
					'css/flexnav.css': 'sass/flexnav.scss',
					'css/page.css': 'sass/page.scss'
				}
			},
			options: {
				'compass': true
			}
		},
		uglify: {
			options: {
				banner: '/*! <%= pkg.name %> <%= pkg.repository %> <%= pkg.license %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      },
      build: {
				src: 'js/jquery.flexnav.js',
        dest: 'js/jquery.flexnav.min.js'
      }
		},		
		coffee: {
			compile: {
				files: {
					'js/jquery.flexnav.js': 'coffeescripts/jquery.flexnav.coffee'
				}
			}
		},

		watch: {
			coffee: {
				files: ['coffeescripts/*'],
				tasks: 'coffee'
			},
			sass: {
				files: ['sass/*'],
				tasks: 'sass'
			}
		}
	});

	// Load necessary plugins
	grunt.loadNpmTasks('grunt-contrib-sass');
	grunt.loadNpmTasks('grunt-contrib-coffee');
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-contrib-uglify');

	grunt.registerTask('default', ['sass', 'uglify', 'coffee', 'watch']);
};
