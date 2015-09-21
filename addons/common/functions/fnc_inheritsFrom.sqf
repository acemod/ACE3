/*
 * Author: Ruthberg
 * Checks whether a given configuration name appears in the inheritance tree of a specific configuration entry.
 *
 * Arguments:
 * 0: configEntry (CONFIG)
 * 1: configname (STING)
 *
 * Return Value:
 * BOOLEAN
 *
 * Public: Yes
 *
 * Note: Not to be confused with the inheritsFrom scripting command.
 *
 * Deprecated
 */
#include "script_component.hpp"

params ["_configEntry", "_configMatch"];

if (configName _configEntry == _configMatch) exitWith {true};
if (configName _configEntry == ",") exitWith {false};

private "_match";
_match = false;

while {configName _configEntry != ""} do {
    if (configName _configEntry == _configMatch) exitWith {
        _match = true;
    };

    _configEntry = inheritsFrom _configEntry;
};

_match
