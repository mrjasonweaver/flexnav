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

	grunt.registerTask('default', ['sass', 'coffee', 'watch']);
};
