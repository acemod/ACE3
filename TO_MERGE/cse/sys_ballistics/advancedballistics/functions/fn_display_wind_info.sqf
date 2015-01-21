#include "defines.h"

#define __dsp (uiNamespace getVariable "RscWindIntuitive")
#define __ctrl (__dsp displayCtrl 132948)

private ["_windSpeed", "_windDir", "_playerDir", "_windIndex", "_windColor", "_newWindSpeed", "_windSource", "_height"];

if (cse_AB_WindInfo) exitWith {
	cse_AB_WindInfo = false;
	0 cutText ["", "PLAIN"];
	true
};
if (underwater player) exitWith { true };
if (vehicle player != player) exitWith { true };

[] spawn {
	2 cutText ["", "PLAIN"];
	cse_AB_Protractor = false;
	1 cutText ["", "PLAIN"];
	cse_AB_WindInfo = true;

	while {cse_AB_WindInfo && !(underwater player) && vehicle player == player} do {
		_windIndex = 12;
		_windColor = [1, 1, 1, 1];

		_windSpeed = (eyePos player) call cse_ab_ballistics_fnc_calculate_wind_speed;

		if (_windSpeed > 0.2) then {
			_playerDir = getDir player;
			_windDir = (wind select 0) atan2 (wind select 1);
			_windIndex = round(((_playerDir - _windDir + 360) % 360) / 30);
			_windIndex = _windIndex % 12;
		};

		// Color Codes from https://en.wikipedia.org/wiki/Beaufort_scale#Modern_scale
		if (_windSpeed > 0.3) then { _windColor = [0.796, 1, 1, 1]; };
		if (_windSpeed > 1.5) then { _windColor = [0.596, 0.996, 0.796, 1]; };
		if (_windSpeed > 3.3) then { _windColor = [0.596, 0.996, 0.596, 1]; };
		if (_windSpeed > 5.4) then { _windColor = [0.6, 0.996, 0.4, 1]; };
		if (_windSpeed > 7.9) then { _windColor = [0.6, 0.996, 0.047, 1]; };
		if (_windSpeed > 10.7) then { _windColor = [0.8, 0.996, 0.059, 1]; };
		if (_windSpeed > 13.8) then { _windColor = [1, 0.996, 0.067, 1]; };
		if (_windSpeed > 17.1) then { _windColor = [1, 0.796, 0.051, 1]; };
		if (_windSpeed > 20.7) then { _windColor = [1, 0.596, 0.039, 1]; };
		if (_windSpeed > 24.4) then { _windColor = [1, 0.404, 0.031, 1]; };
		if (_windSpeed > 28.4) then { _windColor = [1, 0.22, 0.027, 1]; };
		if (_windSpeed > 32.6) then { _windColor = [1, 0.078, 0.027, 1]; };

		0 cutRsc ["RscWindIntuitive", "PLAIN", 1, false];

		__ctrl ctrlSetScale 0.75;
		__ctrl ctrlCommit 0;

		__ctrl ctrlSetText format["cse\cse_sys_ballistics\advancedballistics\data\wind%1.paa", _windIndex];
		__ctrl ctrlSetTextColor _windColor;

		sleep 0.5;
	};

	cse_AB_WindInfo = false;
	0 cutText ["", "PLAIN"];
};

true
