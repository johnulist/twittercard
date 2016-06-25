module.exports = function(grunt) {

    grunt.initConfig({
        compress: {
            main: {
                options: {
                    archive: 'twittercard.zip'
                },
                files: [
                    {src: ['controllers/**'], dest: 'twittercard/', filter: 'isFile'},
                    {src: ['classes/**'], dest: 'twittercard/', filter: 'isFile'},
                    {src: ['docs/**'], dest: 'twittercard/', filter: 'isFile'},
                    {src: ['override/**'], dest: 'twittercard/', filter: 'isFile'},
                    {src: ['logs/**'], dest: 'twittercard/', filter: 'isFile'},
                    {src: ['vendor/**'], dest: 'twittercard/', filter: 'isFile'},
                    {src: ['translations/**'], dest: 'twittercard/', filter: 'isFile'},
                    {src: ['upgrade/**'], dest: 'twittercard/', filter: 'isFile'},
                    {src: ['optionaloverride/**'], dest: 'twittercard/', filter: 'isFile'},
                    {src: ['oldoverride/**'], dest: 'twittercard/', filter: 'isFile'},
                    {src: ['sql/**'], dest: 'twittercard/', filter: 'isFile'},
                    {src: ['lib/**'], dest: 'twittercard/', filter: 'isFile'},
                    {src: ['defaultoverride/**'], dest: 'twittercard/', filter: 'isFile'},
                    {src: ['views/**'], dest: 'twittercard/', filter: 'isFile'},
                    {src: 'config.xml', dest: 'twittercard/'},
                    {src: 'index.php', dest: 'twittercard/'},
                    {src: 'twittercard.php', dest: 'twittercard/'},
                    {src: 'logo.png', dest: 'twittercard/'},
                    {src: 'logo.gif', dest: 'twittercard/'},
                    {src: 'LICENSE.md', dest: 'twittercard/'},
                    {src: 'CONTRIBUTORS.md', dest: 'twittercard/'},
                    {src: 'README.md', dest: 'twittercard/'}
                ]
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-compress');

    grunt.registerTask('default', ['compress']);
};