#include "script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Determines if goggles are visible on passed unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Whether goggles are visible <BOOL>
 *
 * Example:
 * _visible = [ace_player] call ace_goggles_fnc_isGogglesVisible;
 *
 * Public: Yes
 */

params ["_unit"];

private _currentGlasses = goggles _unit;

if (_currentGlasses == "") exitWith {false};

// requires ACE_Resistance config entry. Returns false for balaclavas and bandanas.
if (getNumber (configFile >> "CfgGlasses" >> _currentGlasses >> "ACE_Resistance") == 0) exitWith {false};

// check if in water and has diving goggles or on land and not diving goggles
private _position = getPosASLW _unit;

(surfaceIsWater _position && {_position select 2 < 0.25}) isEqualTo (_currentGlasses call FUNC(isDivingGoggles)) // return
