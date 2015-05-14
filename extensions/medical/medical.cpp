/*
* ace_medical.cpp
*
* Author:
* Glowbal
*/

#include "ace_common.h"
#include <vector>
#include <string>
#include <sstream>
#include "handleDamage.h"

extern "C" {
    __declspec (dllexport) void __stdcall RVExtension(char *output, int outputSize, const char *function);
};

std::vector<std::string> parseExtensionInput(const std::string& input)
{
    std::istringstream ss(input);
    std::string token;

    std::vector<std::string> output;
    while (std::getline(ss, token, ',')) {
        output.push_back(token);
    }
    return output;
}


void __stdcall RVExtension(char *output, int outputSize, const char *function) {
    if (!strcmp(function, "version")) {
        strncpy(output, ACE_FULL_VERSION_STR, outputSize);
    }
    else 
    {
        std::vector<std::string> arguments = parseExtensionInput(function);
        if (arguments.size() > 0) 
        {
            std::string command = arguments.at(0);
            // can we not just use C++11?
            if (command == "addInjuryType") {

            }
            else if (command == "addDamageType") {

            }
            else if (command == "getInjury") {
                // ace::medical::handleDamage();
            }
        }
        std::string returnValue = "";
        strncpy(output, returnValue.c_str(), outputSize);
        output[outputSize - 1] = '\0';
    }
}

