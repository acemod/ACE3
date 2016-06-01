/*
 * ace_random.cpp
 *
 * Provides an interface to std::default_random_engine
 *
 * Arguments:
 * 1: Command
 * 2: ID
 * 3: Seed | Discard notches
 *
 * Examples:
 * "ace_random" callExtension "seed:weatherGenerator:10498103";
 * "ace_random" callExtension "generate:weatherGenerator";
 * "ace_random" callExtension "discard:weatherGenerator:10";
 * "ace_random" callExtension "delete:weatherGenerator";
 *
 */
#include "ace_common.h"

#include <string>
#include <sstream>
#include <vector>
#include <map>
#include <random>

std::vector<std::string> split(std::string input) {
    std::istringstream ss(input);
    std::string token;

    std::vector<std::string> output;
    while (std::getline(ss, token, ':')) {
        output.push_back(token);
    }

    return output;
}

std::map<std::string, std::default_random_engine> random_engines;

extern "C"
{
    __declspec (dllexport) void __stdcall RVExtension(char *output, int outputSize, const char *function);
}

void __stdcall RVExtension(char *output, int outputSize, const char *function)
{
    std::uniform_real_distribution<float> distribution(0.0, 1.0);
    std::vector<std::string> args = split(function);

    if (args.size() > 0) {
        if (args[0] == "version") {
            int n = sprintf_s(output, outputSize, "%s", ACE_FULL_VERSION_STR);
            return;
        }
        if (args[0] == "seed" && args.size() == 3) {
            std::string id = args[1];
            std::default_random_engine::result_type seed = std::stoi(args[2]);
            random_engines[id].seed(seed);
        }
        if (args[0] == "generate" && args.size() == 2) {
            std::string id = args[1];
            float rand = distribution(random_engines[id]);
            int n = sprintf_s(output, outputSize, "%f", rand);
            return;
        }
        if (args[0] == "discard" && args.size() == 3) {
            std::string id = args[1];
            int discard = std::stoi(args[2]);
            random_engines[id].discard(discard);
        }
        if (args[0] == "delete" && args.size() == 2) {
            std::string id = args[1];
            random_engines.erase(id);
        }
    }

    int n = sprintf_s(output, outputSize, "%s", "");
    return;
}

