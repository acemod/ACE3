#include "..\script_component.hpp"
/*
 * Author: marc_book, commy2, DartRuffian
 * Checks if a unit is an engineer.
 *
 * Arguments:
 * 0: Unit to be checked <OBJECT>
 * 1: Engineer level <NUMBER><OPTIONAL>
 *    - Only relevant if ace_repair is loaded
 *
 * Return Value:
 * is the unit an engineer <BOOL>
 *
 * Example:
 * [player] call ace_common_fnc_isEngineer
 *
 * Public: Yes
 */

params ["_unit", ["_engineerN", 1]];

private _isEngineer = _unit getVariable ["ACE_isEngineer", _unit getUnitTrait "engineer"];
// Handle ace_repair modules setting this to a number
if (_isEngineer isEqualType 0) then {_isEngineer = _isEngineer >= _engineerN};

_isEngineer
