#include "script_component.hpp"
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

params ["_unit"];

private _isEngineer = _unit getVariable ["ACE_isEngineer", _unit getUnitTrait "engineer"];
//Handle ace_repair modules setting this to a number
if (_isEngineer isEqualType 0) then {_isEngineer = _isEngineer > 0};

_isEngineer
