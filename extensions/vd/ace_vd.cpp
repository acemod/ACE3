/*
 * ace_vd.cpp
 *
 *
 */

#include "shared.hpp"
#include "model_collection.hpp"
#include "controller.hpp"
#include "arguments.hpp"
#include "ace_vd.hpp"
#include <atomic>

static char version[] = "1.0";

std::string get_command(const std::string & input) {
    size_t cmd_end;
    std::string command;

    cmd_end = input.find(':');
    if (cmd_end < 1) {
        return "";
    }

    return input.substr(0, cmd_end);
}

std::atomic_bool _threaded = false;

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

    std::string result = "-1";

    if (command.size() < 1) {
        output[0] = 0x00;
        return;
    }
    if (command == "version") {
        result = version;
    } else if (command == "echo") {
        result = function;
    } else if (command == "async") {
        _threaded = true;
        result = "0";
    } else if (command == "ready") {
        if (ace::model_collection::get().ready() && ace::model_collection::get().ready()) {
            result = "0";
        } else {
            result = "-1";
        }
    } else if (command == "init") {                                                            // init:
        ace::vehicledamage::controller::get();
        ace::vehicledamage::controller::get().call("reset", _args, result, _threaded);
        result = "0";
        EXTENSION_RETURN();
    } else {
        if (command == "fetch_result") {
            ace::vehicledamage::controller::get().call(command, _args, result, false);
        }
        else {
            ace::vehicledamage::controller::get().call(command, _args, result, _threaded);
        }
    }

    if (result.length() > 0) {
        sprintf_s(output, outputSize, "%s", result.c_str());
    } 
    EXTENSION_RETURN();
}
