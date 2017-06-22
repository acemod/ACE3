/*
* ace_medical.cpp
*
* Author:
* Glowbal
*/

#include "shared.hpp"

#include <stdlib.h>
#include <vector>
#include <string>
#include <sstream>
#include "handleDamage.h"
#include "OpenWound.h"

extern "C" {
    EXPORT void __stdcall RVExtension(char *output, int outputSize, const char *function);
}

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
        strncpy_s(output, outputSize, ACE_FULL_VERSION_STR, _TRUNCATE);
    }
    else
    {
        std::string returnValue = "";
        std::vector<std::string> arguments = parseExtensionInput(function);
        if (arguments.size() > 0)
        {
            try {
                std::string command = arguments.at(0);
                arguments.erase(arguments.begin());

                if (command == "addInjuryType") {
                    returnValue = ace::medical::handleDamage::GetInstance().AddInjuryType(arguments);
                }
                else if (command == "addDamageType") {
                    returnValue = ace::medical::handleDamage::GetInstance().AddDamageType(arguments);
                }
                else if (command == "HandleDamageWounds") {
                    if (arguments.size() >= 4) {
                        std::string selectionName = arguments.at(0);
                        double amountOfDamage = std::stod(arguments.at(1));
                        std::string typeOfDamage = arguments.at(2);
                        int woundID = std::stoi(arguments.at(3));
                        returnValue = ace::medical::handleDamage::GetInstance().HandleDamageWounds(selectionName, amountOfDamage, typeOfDamage, woundID);
                    }
                }
                else if (command == "ConfigComplete") {
                    ace::medical::handleDamage::GetInstance().FinalizeDefinitions();
                }
            }
            catch (std::exception e) {
                std::stringstream debugreturn;
                debugreturn << "diag_log format['ACE3 ERROR - Medical Extension: Something went wrong. Input: '];";
                int i = 0;
                for (auto arg : arguments) {
                    debugreturn << "diag_log format['   arg " << i++ << ":" << arg << "'];";
                }
                debugreturn << "diag_log format['Exception: " << e.what() << "'];";
                returnValue = debugreturn.str();
            }
            catch (...) {
                std::stringstream debugreturn;
                debugreturn << "diag_log format['ACE3 ERROR - Medical Extension: Something went wrong. Input: '];";
                int i = 0;
                for (auto arg : arguments) {
                    debugreturn << "diag_log format['   arg " << i++ << ":" << arg << "'];";
                }
                returnValue = debugreturn.str();
            }
        }

        strncpy_s(output, outputSize, returnValue.c_str(), _TRUNCATE);
    }
}
