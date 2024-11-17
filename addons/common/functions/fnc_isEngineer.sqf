#include "..\script_component.hpp"
/*
 * Author: marc_book, commy2, DartRuffian
 * Checks if a unit is an engineer.
 *
 * Arguments:
 * 0: Unit to be checked <OBJECT>
 * 1: Engineer level <NUMBER> (default: 1)
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

// Convert boolean to number
_isEngineer = [0, 1, 2] select _isEngineer;

_isEngineer >= _engineerN
