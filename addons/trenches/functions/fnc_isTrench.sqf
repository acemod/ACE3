/*
 * Author: chris579
 * Determines whether an object is a trench.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Is trench <BOOL>
 *
 * Example:
 * [myObj] call ace_trenches_fnc_isTrench
 *
 * Public: No
*/
#include "script_component.hpp"
params[
    ["_object", objNull, [objNull]]
];
if(isNull _object) exitWith {false};

getNumber(configFile >> "CfgVehicles" >> typeOf _object >> QGVAR(isTrench)) == 1
