/*
 * Author: commy2
 *
 * Returns the name of the object. Used to prevent issues with the name command.
 *
 * Argument:
 * 0: Object (Object)
 * 1: Show effective commander name? (Bool, optinal default: false)
 *
 * Return value:
 * The name.
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
