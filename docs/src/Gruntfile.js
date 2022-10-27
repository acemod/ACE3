module.exports = function (grunt) {

    const sass = require("node-sass");

    var footer = [
        "js/vendor/modernizr/modernizr.custom.18747.js",
        "js/vendor/picturefill/picturefill.js",
        "js/vendor/jquery/jquery.min.js",
        "js/vendor/foundation/foundation.js",
        "js/vendor/foundation/foundation.topbar.js",
        "js/vendor/foundation/foundation.clearing.js",
        "js/vendor/slick/slick.js",
        "js/vendor/jekyll-toc/jekyll-toc.js",
        "js/core/utils.js",
        "js/components/storage.js",
        "js/components/contentSearch.js",
        "js/app.js"
    ];

    grunt.initConfig({
        pkg: grunt.file.readJSON("package.json"),

        sass: {
            options: {
                implementation: sass,
                includePaths: ["components/foundation/scss"]
            },
            dist: {
                options: {
                    outputStyle: "compressed"
                },
                files: {
                    "../css/app.css": "scss/app.scss"
                }
            }
        },

        watch: {
            grunt: {files: ["Gruntfile.js"]},

            sass: {
                files: "scss/**/*.scss",
                tasks: ["sass"]
            },
            js: {
                files: [
                    "js/**/*.js"
                ],
                tasks: ["concat", "uglify"]
            },
            img: {
                files: [
                    "img/**/*"
                ],
                tasks: ["imagemin"]
            }
        },
        concat: {
            footer: {
                src: [footer],
                dest: "../js/footer.dev.js"
            }
        },
        uglify: {
            "footer": {
                options: {
                    sourceMap: "../js/footer-source-map.js",
                    sourceMappingURL: "footer-source-map.js",
                    sourceMapPrefix: 2,
                    sourceMapRoot: "../../dist/js/",
                    mangle: true,
                    compress: true
                },
                files: {
                    "../js/footer.min.js": [footer]
                }
            }
        },
        imagemin: {
            dynamic: {                              // Another target
                files: [{
                    expand: true,                   // Enable dynamic expansion
                    cwd: "img/",                    // Src matches are relative to this path
                    src: ["**/*.{png,jpg,gif}"],    // Actual patterns to match
                    dest: "../img/"                 // Destination path prefix
                }]
            }
        }
    });

    grunt.loadNpmTasks("grunt-sass");
    grunt.loadNpmTasks("grunt-contrib-watch");
    grunt.loadNpmTasks("grunt-contrib-concat");
    grunt.loadNpmTasks("grunt-contrib-uglify");
    grunt.loadNpmTasks("grunt-contrib-imagemin");

    grunt.registerTask("build", ["sass", "concat", "uglify:footer"]);
    grunt.registerTask("default", ["build", "watch"]);
};
