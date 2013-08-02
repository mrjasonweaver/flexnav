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
        jshint: {
            files: ['Gruntfile.js', 'js/*.js'],
            options: {
                // options here to override JSHint defaults
                globals: {
                    jQuery: true,
                    console: true,
                    module: true,
                    document: true
                }
            }
        },
        coffeelint: {
            files: ['coffeescripts/*.coffee'],
            options: {
              'no_trailing_whitespace': {
                  'level': 'error'
              },
              'max_line_length': {
                  'level': 'ignore'
              }
          }
        },
        watch: {
            coffeelint: {
                files: ['coffeescripts/*.coffee'],
                tasks: 'coffeelint'
            },           
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
    grunt.loadNpmTasks('grunt-coffeelint');
    grunt.loadNpmTasks('grunt-contrib-jshint');
	grunt.loadNpmTasks('grunt-contrib-sass');
	grunt.loadNpmTasks('grunt-contrib-coffee');
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-contrib-uglify');

    grunt.registerTask('test', ['jshint']);
	grunt.registerTask('default', ['sass', 'coffee', 'uglify', 'jshint', 'watch']);
};