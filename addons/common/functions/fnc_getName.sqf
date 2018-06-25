#include "script_component.hpp"
/*
 * Author: commy2
 * Returns the name of the object. Used to prevent issues with the name command.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Use effective commander name when used on vehicles (default: false) <BOOL>
 * 2: Get Raw Name (Don't sanatize HTML tags `</>`) (default: false) <BOOL>
 *
 * Return Value:
 * Object Name <STRING>
 *
 * Example:
 * [player, false, true] call ace_common_fnc_getName;
 *
 * Public: Yes
 */

params ["_unit", ["_showEffective", false], ["_useRaw", false]];

private _name = "";

if (_unit isKindOf "CAManBase") then {
    _name = _unit getVariable [(["ACE_Name", "ACE_NameRaw"] select _useRaw), localize QUOTE(DOUBLES(STR,GVAR(Unknown)))];
} else {
    if (_showEffective) then {
        _name = [effectiveCommander _unit, false, _useRaw] call FUNC(getName);
    } else {
        _name = getText (configFile >> "CfgVehicles" >> typeOf _unit >> "displayName");
    };
};

_name
