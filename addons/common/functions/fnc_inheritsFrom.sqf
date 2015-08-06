/*
 * Author: Ruthberg
 *
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
 */
#include "script_component.hpp"

private ["_match"];
params ["_configEntry", "_configMatch"];

if (configName _configEntry == _configMatch) exitWith { true };
if (configName _configEntry == ",") exitWith { false };

_match = false;
while {configName _configEntry != ""} do {
    if (configName _configEntry == _configMatch) exitWith { _match = true };
    _configEntry = inheritsFrom(_configEntry);
};

_match
