#
# FormBuilder2 Landing Page
# https://github.com/owldesign/formbuilder2-website
# @author Vadim Goncharov
# @package formbuilder2-landing
#

module.exports = (grunt) ->
  grunt.initConfig

    # =============================================
    # VARIABLES
    # =============================================
    ScssDirectory: 'assets/scss'
    CoffeeDirectory: 'assets/coffee'
    DistributionDirectory: 'assets'

    # =============================================
    # WATCH FOR CHANGE
    # =============================================
    watch:
      css:
        files: ['<%= ScssDirectory %>/**/*']
        tasks: ['sass']
      scripts:
        files: ['<%= CoffeeDirectory %>/*']
        tasks: ['coffee', 'uglify:dist']
      options:
        livereload: false

    # =============================================
    # SASS COMPILE
    # =============================================
    # https://github.com/gruntjs/grunt-contrib-sass
    # =============================================
    sass:
      compile:
        options:
          compress: false
          sourcemap: 'none' # none, file, inline, none
          style: 'compressed' # nested, compact, compressed, expanded
        files: 
          '<%= DistributionDirectory %>/css/application.css': '<%= ScssDirectory %>/application.scss'

    # =============================================
    # COFFEE COMPILING
    # =============================================
    # https://github.com/gruntjs/grunt-contrib-coffee
    # =============================================
    coffee:
      options:
        join: true
        bare: true
      compile:
        files:
          '<%= DistributionDirectory %>/js/application.js': '<%= CoffeeDirectory %>/*.coffee'

    # =============================================
    # UGLIFY JAVASCRIPT
    # =============================================
    # https://github.com/gruntjs/grunt-contrib-uglify
    # =============================================
    uglify:
      options:
        sourceMap: false
        mangle: false
        beautify: false
        compress: true
      dist:
        files:
          '<%= DistributionDirectory %>/js/application.min.js': ['<%= DistributionDirectory %>/js/application.js']

    # =============================================
    # LOAD PLUGINS
    # =============================================
    grunt.loadNpmTasks 'grunt-contrib-sass'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-uglify'

    # =============================================
    # TASKS
    # =============================================
    grunt.registerTask 'default', ['watch']