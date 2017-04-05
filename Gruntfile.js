module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    pug: {
      compile: {
        options: {
          client: false,
          pretty: true,
        },
        files: [{
          cwd: "src",
          src: "**/*.pug",
          dest: "tmp",
          expand: true,
          ext: ".html"
        }]
      }
    },
    coffeelint: {
      app: ['src/**/*.coffee'],
      spec: ['spec/**/*.coffee']
    },
    coffee: {
      app: {
        expand: true,
        flatten: false,
        cwd: 'src',
        src: "**/*.coffee",
        dest: 'tmp/javascripts/',
        ext: '.js'
      },
      spec: {
        expand: true,
        flatten: false,
        cwd: 'spec',
        src: "**/*.coffee",
        dest: 'tmp/spec/',
        ext: '.js'
      }
    },
    ngtemplates: {
      'fiskkit': {
        cwd: 'tmp',
        src: '*/**/*.html',
        dest: 'tmp/javascripts/templates.js'
      }
    },
    copy: {
      main: {
        src: 'tmp/index.html',
        dest: 'build/index.html'
      },
      cssMap: {
        src: 'tmp/stylesheets/app.css.map',
        dest: 'build/stylesheets/app.css.map'
      },
      target: {
        expand: true,
        cwd: 'static/',
        src: '**',
        dest: 'build/',
        flatten: false,
        filter: 'isFile'
      }
    },
    sass: {
      options: {
        sourceMap: false
      },
      dist: {
        files: {
          'tmp/stylesheets/app.css': 'stylesheets/app.sass'
        }
      }
    },
    autoprefixer: {
      options: {
        browsers: ['last 2 versions', '> 5% in US'],
        map: false
      },
      build: {
        expand: true,
        flatten: true,
        src: 'tmp/stylesheets/*.css',
        dest: 'tmp/stylesheets-prefixed/'
      }
    },
    concat: {
      vendorCss: {
        src: [
          'bower_components/reset-css/reset.css',
          'bower_components/angular-material/angular-material.css'
        ],
        dest: 'build/stylesheets/vendor.css'
      },
      appCss: {
        src: [
          'tmp/stylesheets-prefixed/app.css'
        ],
        dest: 'build/stylesheets/app.css'        
      },
      appJs: {
        src: ['tmp/javascripts/app.js', 'tmp/javascripts/**/*.js'],
        dest: 'build/javascripts/app.js'
      },
      vendorJs: {
        src: [
          'bower_components/jquery/dist/jquery.js',
          'bower_components/lodash/lodash.js',
          'bower_components/angular/angular.js',
          'bower_components/angular-ui-router/release/angular-ui-router.js',
          'bower_components/angular-sanitize/angular-sanitize.js',
          'bower_components/angular-animate/angular-animate.js',
          'bower_components/angular-aria/angular-aria.js',
          'bower_components/angular-messages/angular-messages.js',
          'bower_components/angular-material/angular-material.js'
        ],
        dest: 'build/javascripts/vendor.js'
      }
    },
    clean: {
      build: ['tmp', 'build']
    },
    connect: {
      server: {
        options: {
          base: './build',
          keepalive: true,
          port: 8888,
          open: 'http://localhost:8888'
        }
      }
    },
    zip: {
      release: {
        cwd: 'build/',
        src: 'build/**/*',
        dest: 'release.zip'
      }
    },
    watch: {
      coffee: {
        files: ['src/**/*.coffee', 'spec/**/*.coffee'],
        tasks: ['coffee']
      },
      pug: {
        files: ['src/**/*.pug'],
        tasks: ['pug']
      },
      templates: {
        files: ['tmp/*/**/*.html'],
        tasks: ['ngtemplates']
      },
      sass: {
        files: ['stylesheets/*.sass'],
        tasks: ['sass']
      },
      autoprefixer: {
        files: ['tmp/stylesheets/*.css'],
        tasks: ['autoprefixer']
      },
      copy: {
        files: ['tmp/index.html', 'static/**/*'],
        tasks: ['copy']
      },
      concat: {
        files: [
          'tmp/stylesheets-prefixed/*.css',
          'bower_components/**/*.css',
          'bower_components/**/*.js',
          'tmp/javascripts/app.js',
          'tmp/javascripts/**/*.js'
        ],
        tasks: ['concat']
      }
    }
  });

  grunt.loadNpmTasks('grunt-coffeelint');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-pug');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-angular-templates');
  grunt.loadNpmTasks('grunt-sass');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-autoprefixer');
  grunt.loadNpmTasks('grunt-contrib-connect');

  grunt.registerTask('build', ['coffee', 'pug', 'ngtemplates', 'sass', 'autoprefixer', 'concat', 'copy']);
  grunt.registerTask('build_zip', ['build', 'zip']);
  grunt.registerTask('watch_build', ['clean', 'build', 'watch']);
};
