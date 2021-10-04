/*
 * ace_vd.cpp
 *
 *
 */

#include "shared.hpp"
#include "arguments.hpp"
#include "dispatch.hpp"

static char version[] = "1.0";

#ifndef _STATIC
extern "C" {
    __declspec (dllexport) void __stdcall RVExtension(char *output, int outputSize, const char *function);
};

#endif

std::string get_command(const std::string & input) {
    size_t cmd_end;
    std::string command;

    cmd_end = input.find(':');
    if (cmd_end < 1) {
        return "";
    }

    return input.substr(0, cmd_end);
}


void __stdcall RVExtension(char *output, int outputSize, const char *function) {
    ZERO_OUTPUT();

    // Get the command, then the command args
    std::string input = function;

    std::string command = get_command(input);
    std::string argument_str;
    if (command.length() > 1 && input.length() > command.length()+1) {
        argument_str = input.substr(command.length() + 1, (input.length() + 1 - command.length()));
    }
    ace::arguments _args(argument_str);

    std::string result = "";

    if (command.size() < 1) {
        output[0] = 0x00;
        EXTENSION_RETURN();
    }
    if (command == "version") {
        result = version;
    }
    if (command == "echo") {
        result = function;
    }

    /*************************/
    // Real functionality goes here
    ace::dispatch::get().call(command, _args, result);

    sprintf_s(output, outputSize - 1, "%s", result.c_str());
    EXTENSION_RETURN();
}
