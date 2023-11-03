import terser from "@rollup/plugin-terser";
import scss from "rollup-plugin-scss";
import svgicons from "rollup-plugin-svg-icons";

export default {
    input: "./main.js",
    output: [
        {
            file: "../dist/bundle.js",
        },
        {
            file: "../dist/bundle.min.js",
            format: "iife",
            name: "version",
            plugins: [terser()],
        },
    ],
    plugins: [
        scss({
            fileName: "bundle.css",
            sourceMap: true,
            outputStyle: "compressed",
        }),
        svgicons({
            inputFolder: "./icons",
            output: "../dist/icons.svg",
        }),
    ],
};
