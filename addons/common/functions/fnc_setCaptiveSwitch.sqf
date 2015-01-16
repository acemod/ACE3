/**
 * fn_setCaptiveSwitch.sqf
 * @Descr: Register a unit as captive for the unconscious state
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT, setCaptive BOOL]
 * @Return: BOOL True if unit is put as set captive, otherwise false
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit", "_captiveSwitch", "_setCaptive"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_Param;
_setCaptive = [_this, 1, false, [false]] call BIS_fnc_Param;


_captiveSwitch = true;
if (_setCaptive) then {
	if (captive _unit) then {
		_captiveSwitch = false;
	} else {
		if (player == _unit) then {
			missionNamespace setvariable[QGVAR(unconscious_non_captive_f),true];
		};
		_unit setCaptive true;
		[format["USED SETCAPTIVE",_unit]] call FUNC(debug);
	};
} else {
	if (alive _unit) then {
		_unit setCaptive false;
		if (!isnil QGVAR(unconscious_non_captive_f)) then {
			missionNamespace setvariable[QGVAR(unconscious_non_captive_f),nil];
		};
	} else {
		_unit setCaptive false;
	};
};

_captiveSwitch