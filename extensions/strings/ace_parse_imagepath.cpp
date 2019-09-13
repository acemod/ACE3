/*
 * ace_parse_imagepath.cpp
 * Author: PabstMirror
 * Gets raw image path from structured text input.
 *
 * Takes:
 * Structured text that usualy has an image:
 * Example: "<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\open_door_ca.paa' size='2.5' />";
 *
 * Returns:
 * Just the image path or "" if none
 */

#include "ace_parse_imagepath.hpp"

std::string getImagePathFromStructuredText(const std::string& input) {
    std::string returnValue = "";
    std::size_t endIndex = input.find(".paa");
    std::size_t startIndex = endIndex - 1;
    if ((endIndex != std::string::npos) && (endIndex > 1)) {
        endIndex = endIndex + 4;
        while ((startIndex > 0) && (returnValue == "")) {
            if ((input[startIndex]) == '\'') {
                returnValue = input.substr((startIndex + 1), (endIndex - startIndex - 1));
            };
            startIndex = startIndex - 1;
        };
    };
    return returnValue;
}
