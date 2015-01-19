/*
	fnc_isGogglesVisible.sqf

	Author: Garth de Wet (LH)

	Description:
	Determines if goggles are visible on passed unit (Also checks if unit is in vehicle and cameraView is set to GUNNER)

	Parameters:
	0: Object - unit to check for visible goggles

	Returns:
	BOOL - Whether the goggles are visible or not.

	Example:
	_visible = ace_player call FUNC(isGogglesVisible);
*/
#include "script_component.hpp"
private ["_currentGlasses", "_result", "_unit"];
_unit = _this;

_currentGlasses = goggles _unit;
_result = false;

if ((vehicle _unit) != _unit) exitWith {(cameraView != "GUNNER")};

if (_currentGlasses != "") then {
	_position =(getPosASLW _unit);
	if (surfaceIsWater _position && {((_position select 2) < 0.25)}) exitWith {
		_result = (_currentGlasses call FUNC(isDivingGoggles));
	};
	if (getNumber (ConfigFile >> "CfgGlasses" >> _currentGlasses >> "ACE_Resistance") == 0) exitWith {
		_result = false;
	};
	_result = !(_currentGlasses call FUNC(isDivingGoggles));
};

_result
