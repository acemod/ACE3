#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Called on load of GPS UI
 *
 * Arguments:
 * Display <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [1] call ace_missileguidance_fnc_gps_onLoad
 *
 * Public: No
 */
[{
	params ["_display"];
	uiNamespace setVariable [QGVAR(gpsAttackOptionDisplay), _display];

	private _mode = if (GVAR(mode) isEqualTo "too") then {
		GPS_UI_TOO
	} else {
		GPS_UI_PB
	};

	[_mode, true] call FUNC(gps_modeSelect);
	(_display displayCtrl GPS_UI_PB_MISSION) ctrlSetText format ["PP %1", GVAR(gps_pbMode) + 1];

	// update current settings
	GVAR(gps_uiPerFrameHandler) = [{
		GVAR(gps_currentSettings) = [-1] call FUNC(gps_saveAttackSettings);
		systemChat str GVAR(gps_currentSettings);
	}] call CBA_fnc_addPerFrameHandler;
}, _this] call CBA_fnc_execNextFrame;

