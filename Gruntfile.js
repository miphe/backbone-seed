module.exports = function (grunt) {

  // Project configuration.
  grunt.initConfig({

    pkg: grunt.file.readJSON('package.json'),

    browserify: {

      app: {
        src: ['app/coffee/**/*.coffee'],
        dest: 'app/public/scripts/app.js',
        options: {
          transform: ['coffeeify', 'browserify-compile-templates'],
          // extension: '.html',
          debug: true
        }
      },

      tests: {
        // src: ['test/coffee/**/*.coffee'],
        src: ['test/coffee/main.coffee'],
        dest: 'test/scripts/tests.js',
        options: {
          transform: ['coffeeify', 'browserify-compile-templates'],
          debug: true
        }
      }
    },

    sass: {
      options: {
        indentedSyntax: true,
        outputStyle: 'compressed',
        sourceMap: false
      },

      dist: {
        files: {
          'app/public/css/app.css': 'app/sass/collection.sass'
        }
      }
    },

    sassdoc: {
      default: {
        src: 'app/sass',
        options: {
          dest: 'docs/sassdoc',
          display: {
            access: ['public', 'private'],
            alias: true,
            watermark: true
          },
          groups: {
            slug: 'Title',
            config: 'Configuration',
            typography: 'Typography',
            helpers: 'Helpers',
            hacks: 'Hacks & Fixes',
            'undefined': 'Ungrouped'
          },
          basePath: 'https://github.com/miphe/backbone-seed/app/sass'
        }
      }
    },

    jsdoc: {
      dist: {
        src: ['app/public/scripts/**/*.js', 'test/scripts/**/*.js'],
        options: {
          destination: 'docs/jsdoc'
        }
      }
    },

    watch: {
      sass: {
        files: ['app/sass/**/*.{scss,sass}'],
        tasks: ['sass:dist'],
        options: {
          interrupt: true
        }
      },

      // sassdoc: {
      //   files: ['app/sass/**/*.{scss,sass}'],
      //   tasks: ['sassdoc'],
      //   options: {
      //     interrupt: true
      //   }
      // },

      // foundation: {
      //   files: ['node_modules/**/*.js'],
      //   tasks: ['browserify:foundation'],
      //   options: {
      //     interrupt: true
      //   }
      // },

      appScripts: {
        files: ['app/coffee/**/*.coffee'],
        tasks: ['browserify:app'],
        options: {
          interrupt: true
        }
      },

      // jsdoc: {
      //   files: ['app/public/scripts/**/*.js'],
      //   tasks: ['jsdoc'],
      //   options: {
      //     interrupt: true
      //   }
      // },

      testScripts: {
        files: ['test/coffee/**/*.coffee'],
        tasks: ['browserify:tests'],
        options: {
          interrupt: true
        }
      }
    },

    connect: {
      app: {
        options: {
          port: 9001,
          base: './app/public/',
          onCreateServer: function (server, connect, options) {
            console.log('Web server for app created.');
          }
        }
      },

      test: {
        options: {
          port: 9002,
          base: './test/',
          onCreateServer: function (server, connect, options) {
            console.log('Web server for tests created.');
          }
        }
      },

      docs: {
        options: {
          port: 9003,
          base: './docs',
          onCreateServer: function (server, connect, options) {
            console.log('Web server for docs created.');
          }
        }
      }
    }
  });

  grunt.loadNpmTasks('grunt-coffeeify');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-browserify');
  grunt.loadNpmTasks('grunt-sass');
  grunt.loadNpmTasks('grunt-sassdoc');
  grunt.loadNpmTasks('grunt-jsdoc');
  grunt.loadNpmTasks('grunt-contrib-connect');

  grunt.registerTask('default', ['browserify', 'sass']);

  // No server
  grunt.registerTask('dev',     ['browserify', 'sass', 'watch']);

  // With app server
  grunt.registerTask('dev-s',   ['browserify', 'sass', 'connect:app', 'connect:test', 'watch']);

  // With doc server
  grunt.registerTask('dev-d',   ['browserify', 'sass', 'sassdoc', 'jsdoc', 'connect:docs', 'watch']);

  // With app server
  // With doc server
  grunt.registerTask('dev-sd',  ['browserify', 'sass', 'sassdoc', 'jsdoc', 'connect', 'watch']);

  // Only run app server
  grunt.registerTask('s',       ['connect:app']);
};
