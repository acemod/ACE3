/*
 * Author: commy2
 * Returns the name of the object. Used to prevent issues with the name command.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Use effective commander name (default: false) <BOOL>
 *
 * Return Value:
 * Object Name <STRING>
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_name"];

params ["_unit", "_showEffective"];

if (isNil "_showEffective") then {
    _showEffective = false;
};

_name = "";

if (_unit isKindOf "CAManBase") then {
    _name = _unit getVariable ["ACE_Name", localize QUOTE(DOUBLES(STR,GVAR(Unknown)))];
} else {
    if (_showEffective) then {
        _name = [effectiveCommander _unit] call FUNC(getName);
    } else {
        _name = getText (configFile >> "CfgVehicles" >> typeOf _unit >> "displayName");
    };
};

_name
