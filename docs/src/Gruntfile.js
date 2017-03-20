module.exports = function (grunt) {

    require('load-grunt-tasks')(grunt);

    var vendor = [
        "js/vendor/modernizr/modernizr.custom.18747.js",
        "js/vendor/picturefill/picturefill.js",
        "js/vendor/jquery/jquery.min.js",
        "js/vendor/slick/slick.js",
        "js/vendor/jekyll-toc/jekyll-toc.js"
    ];

    var foundation = [
        "js/vendor/foundation/foundation.core.js",
        "js/vendor/foundation/foundation.util.mediaQuery.js",
        "js/vendor/foundation/foundation.util.motion.js",
        "js/vendor/foundation/foundation.util.triggers.js",
        "js/vendor/foundation/foundation.toggler.js",
        "js/vendor/foundation/foundation.responsiveMenu.js",
        "js/vendor/foundation/foundation.responsiveToggle.js",
        "js/vendor/foundation/foundation.sticky.js",
        "js/vendor/foundation/foundation.magellan.js"

    ];

    var custom = [
        "js/core/utils.js",
        "js/components/analytics.js",
        "js/components/storage.js",
        "js/components/contentSearch.js",
        "js/app.js"
    ];

    grunt.initConfig({
        pkg: grunt.file.readJSON("package.json"),

        sass: {
            options: {
                includePaths: ['node_modules/foundation-sites/scss']
            },
            dev: {
                options: {
                    outputStyle: "nested"
                },
                files: {
                    "../css/app.css": "scss/app.scss"
                }
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

        postcss: {
            autoprefixer: {
                options: {
                    processors: [
                        require("autoprefixer")({browsers: ['last 2 versions', 'ie >= 9', 'and_chr >= 2.3']})
                    ]
                },

                files: [{
                    src: "../css/app.css",
                    dest: "../css/app.css",
                    ext: ".css"
                }]

            }
        },

        watch: {
            grunt: {
                files: ["Gruntfile.js"],
                options: {
                    reload: true
                }
            },

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
            foundation: {
                src: [foundation],
                dest: ".tmp/foundation.js"
            },
            footer: {
                src: [vendor, ".tmp/foundation.js", custom],
                dest: "../js/footer.min.js"
            }
        },

        babel: {
            options: {
                sourceMap: false,
                presets: ['es2015']
            },
            foundation: {
                files: {
                    ".tmp/foundation.js": ".tmp/foundation.js"
                }
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
                    "../js/footer.min.js": "../js/footer.min.js"
                }
            }
        },

        imagemin: {
            dynamic: {                         // Another target
                files: [{
                    expand: true,                  // Enable dynamic expansion
                    cwd: "img/",                   // Src matches are relative to this path
                    src: ["**/*.{png,jpg,gif}"],   // Actual patterns to match
                    dest: "../img/"                  // Destination path prefix
                }]
            }
        }
    });

    grunt.registerTask("buildJs", ["concat:foundation", "babel", "concat:footer"/*, "uglify:footer"*/]);

    grunt.registerTask("build", ["sass:dev", "postcss:autoprefixer", "buildJs"]);

    grunt.registerTask("default", ["build", "watch"]);
};
