/*
 * ace_breakLine.cpp
 *
 * Takes a string and insert as many line breaks as needed so it fits a given width
 *
 * Takes:
 * Localized string as string
 * Example: "Check weapon temperature"
 *
 * Returns:
 * String with line breaks
 */

#include "ace_common.h"

#include <sstream>
#include <vector>
#include <string>

#define MAXCHARACTERS 11

static char version[] = "1.0";

extern "C" {
    __declspec (dllexport) void __stdcall RVExtension(char *output, int outputSize, const char *function);
};

std::vector<std::string> splitString(std::string input) {
    std::istringstream ss(input);
    std::string token;

    std::vector<std::string> output;
    while (std::getline(ss, token, ',')) {
        output.push_back(token);
    }

    return output;
}

std::string addLineBreaks(std::string input) {
    std::stringstream sstream;
    int numChar = 0;
    for ( int i = 0 ; i < input.length(); i++) {
        if (numChar >= MAXCHARACTERS && input[i] == ' ') {
            sstream << "<br/>";//"&lt;br/&gt;";
            numChar = 0;
        } else {
            sstream << input[i];
            numChar++;
        }
    }
    return sstream.str();
}

// i like to live dangerously. jk, fix strncpy sometime pls.
#pragma warning( push )
#pragma warning( disable : 4996 )

void __stdcall RVExtension(char *output, int outputSize, const char *function) {
    if (!strcmp(function, "version")) {
        strncpy(output, version, outputSize);
    } else {
        std::vector<std::string> argStrings = splitString(function);
        std::string originalString = argStrings[0];

        strcpy(output, addLineBreaks(originalString).c_str());
        output[outputSize - 1] = '\0';
    }
}

#pragma warning( pop )
