module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      base:
        expand: true
        cwd: 'app/'
        src: '**/*.coffee'
        dest: 'app/'
        ext: '.js'
        options:
          bare: true
    exec:
      alloy:
        cmd: 'alloy compile'
      build:
        cmd: 'ti build -p android -b'
      clean:
        cmd: 'rm -rf build build.log Resources app/**/*.js'

  grunt.registerTask 'default', ['clean', 'compile', 'build']
  grunt.registerTask 'compile', ['coffee:base', 'exec:alloy']
  grunt.registerTask 'build', ['exec:build']
  grunt.registerTask 'clean', ['exec:clean']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-exec'
