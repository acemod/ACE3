/*
 * ace_break_line.cpp
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

#include "shared.hpp"

#include <stdlib.h>
#include <sstream>
#include <vector>
#include <string>

#define MAXCHARACTERS 14

extern "C" {
    EXPORT void __stdcall RVExtension(char *output, int outputSize, const char *function);
}

std::vector<std::string> splitString(const std::string & input) {
    std::istringstream ss(input);
    std::string token;

    std::vector<std::string> output;
    while (std::getline(ss, token, ' ')) {
        output.push_back(token);
    }

    return output;
}

std::string addLineBreaks(const std::vector<std::string> &words) {
    std::stringstream sstream;
    size_t numChar = 0;
    size_t i = 0;

    while (i < words.size()) {
        if (numChar == 0) {
            sstream << words[i];
            numChar += words[i].size();
            i++;
        } else {
            if (numChar + 1 + words[i].size() > MAXCHARACTERS) {
                sstream << "<br/>";
                numChar = 0;
            } else {
                sstream << " " << words[i];
                numChar += 1 + words[i].size();
                i++;
            }
        }
    }

    return sstream.str();
}

void __stdcall RVExtension(char *output, int outputSize, const char *function) {
    ZERO_OUTPUT();
    if (!strcmp(function, "version")) {
        strncpy_s(output, outputSize, ACE_FULL_VERSION_STR, _TRUNCATE);
    } else {
        strncpy_s(output, outputSize, addLineBreaks(splitString(function)).c_str(), _TRUNCATE);
    }
    EXTENSION_RETURN();
}
