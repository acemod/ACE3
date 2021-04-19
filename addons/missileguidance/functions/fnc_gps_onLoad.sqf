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
		if (GVAR(mode) isEqualTo "too") then {
			// update coordinates based on TGP position
			private _target = getPilotCameraTarget (vehicle ACE_PLAYER);
			_target params ["_tracking", "_position", "_object"];

			if (_position isNotEqualTo [0, 0, 0]) then {
				private _mapGrid = [_position] call EFUNC(common,getMapGridFromPos);
				_mapGrid params ["_easting", "_northing"];
				private _height = _position#2;

				private _display = uiNamespace getVariable QGVAR(gpsAttackOptionDisplay);
				(_display displayCtrl GPS_UI_EASTING) ctrlSetText _easting;
				(_display displayCtrl GPS_UI_NORTHING) ctrlSetText _northing;
				(_display displayCtrl GPS_UI_HEIGHT) ctrlSetText str _height;
			};
		};

		// info is read from text boxes, so if boxes are update this will be updated
		GVAR(gps_currentSettings) = [-1] call FUNC(gps_saveAttackSettings);
	}] call CBA_fnc_addPerFrameHandler;
}, _this] call CBA_fnc_execNextFrame;

