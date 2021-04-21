#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Returns attack data for GPS guided bomb
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_missileguidance_fnc_gps_getAttackData
 *
 * Public: No
 */

if (GVAR(gps_mode) isEqualTo "too") then {
	private _target = getPilotCameraTarget (vehicle ACE_PLAYER);
	_target params ["_tracking", "_position", "_object"];
	GVAR(gps_currentSettings) set [0, _position]
};

// create a copy of this array to make sure values are not overwritten
[
	GVAR(gps_currentSettings)#0,
	GVAR(gps_currentSettings)#1,
	GVAR(gps_currentSettings)#2
]

