/*
 * Author: Garth 'L-H' de Wet
 * Determines if goggles are visible on passed unit (also checks if unit is in vehicle and cameraView is set to GUNNER)
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Whether goggles are visible <BOOL>
 *
 * Example:
 * _visible = [player] call ace_goggles_fnc_isGogglesVisible;
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit"];
private ["_currentGoggles", "_result", "_position", "_visible"];

_currentGoggles = goggles _unit;
_result = false;

if ((vehicle _unit) != _unit) exitWith {(cameraView != "GUNNER")};

if (_currentGoggles != "") then {
    _position = getPosASLW _unit;
    if (surfaceIsWater _position && {((_position select 2) < 0.25)}) exitWith {
        _result = ([_currentGoggles] call FUNC(isDivingGoggles));
    };
    if (getNumber (ConfigFile >> "CfgGlasses" >> _currentGoggles >> "ACE_Resistance") == 0) exitWith {
        _result = false;
    };
    _result = !([_currentGoggles] call FUNC(isDivingGoggles));
};

_result
