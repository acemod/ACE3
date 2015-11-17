/*
 * Author: marc_book, edited by commy2
 * Checks if a unit is an engineer.
 *
 * Arguments:
 * 0: unit to be checked <OBJECT>
 *
 * Return Value:
 * is the unit an engineer <BOOL>
 *
 * Example:
 * [player] call ace_common_fnc_isEngineer
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit"];

private _isEngineer = _unit getVariable ["ACE_isEngineer", getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "engineer") == 1];
//Handle ace_repair modules setting this to a number
if ((typeName _isEngineer) == "SCALAR") then {_isEngineer = _isEngineer > 0};

_isEngineer
