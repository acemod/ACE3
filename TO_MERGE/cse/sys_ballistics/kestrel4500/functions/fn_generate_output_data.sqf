#include "script_component.hpp"

private ["_playerDir", "_textTop", "_textCenterBig", "_textCenterLine1Left", "_textCenterLine2Left", "_textCenterLine3Left", "_textCenterLine1Right", "_textCenterLine2Right", "_textCenterLine3Right", "_textInfoLine1", "_textInfoLine2", "_temperature", "_humidity", "_windSpeed", "_windDir", "_newWindSpeed", "_windSource", "_height"];

if (isNil "cse_AB_Altitude") then {AB_Altitude = 0};
if (isNil "cse_AB_Temperature") then {AB_Temperature = 0};

call cse_ab_Kestrel4500_fnc_collect_data;

_textTop = cse_ab_Kestrel4500_Menus select cse_ab_Kestrel4500_Menu;
_textCenterBig = "";

_textCenterLine1Left = "";
_textCenterLine2Left = "";
_textCenterLine3Left = "";
_textCenterLine1Right = "";
_textCenterLine2Right = "";
_textCenterLine3Right = "";

_textInfoLine1 = "";
_textInfoLine2 = "";

_windSpeed = vectorMagnitude wind;
_windDir = (wind select 0) atan2 (wind select 1);

_temperature = 15;
_humidity = humidity;

if (call cse_ab_Kestrel4500_fnc_hasAdvancedBallisticsEnabled) then {
	_windSpeed = (eyePos player) call cse_ab_ballistics_fnc_calculate_wind_speed;
	_temperature = ((getPosASL player) select 2) call cse_ab_ballistics_fnc_get_temperature_at_height;
	_humidity = ((getPosASL player) select 2) call cse_ab_ballistics_fnc_get_humidity_at_height;
};

_playerDir = getDir player;
_windSpeed = cos(_playerDir - _windDir) * _windSpeed;

cse_ab_Kestrel4500_Direction = 4 * floor(_playerDir / 90);
if (_playerDir % 90 > 10) then { cse_ab_Kestrel4500_Direction = cse_ab_Kestrel4500_Direction + 1};
if (_playerDir % 90 > 35) then { cse_ab_Kestrel4500_Direction = cse_ab_Kestrel4500_Direction + 1};
if (_playerDir % 90 > 55) then { cse_ab_Kestrel4500_Direction = cse_ab_Kestrel4500_Direction + 1};
if (_playerDir % 90 > 80) then { cse_ab_Kestrel4500_Direction = cse_ab_Kestrel4500_Direction + 1};
cse_ab_Kestrel4500_Direction = cse_ab_Kestrel4500_Direction % 16;

switch (cse_ab_Kestrel4500_Menu) do {
	case 0: { // Direction
		if (!cse_ab_Kestrel4500_MinAvgMax) then {
			_textCenterBig = format["%1", format["%1 %2", cse_ab_Kestrel4500_Directions select cse_ab_Kestrel4500_Direction, round(_playerDir)]];
		} else {
			_textCenterLine1Left = "Min";
			_textCenterLine2Left = "Avg";
			_textCenterLine3Left = "Max";
			_textCenterLine1Right = "N/A";
			_textCenterLine2Right = "N/A";
			_textCenterLine3Right = "N/A";
		};
	};
	case 1: { // Wind SPD
		if (!cse_ab_Kestrel4500_MinAvgMax) then {
			_textCenterBig = Str(round(abs(_windSpeed) * 10) / 10);
		} else {
			_textCenterLine1Left = "Max";
			_textCenterLine2Left = "Avg";
			switch (cse_ab_Kestrel4500_MinAvgMaxMode) do {
				case 0: {
					_textCenterLine1Right = "--. -";
					_textCenterLine2Right = "--. -";
					_textInfoLine2 = "- average";
				};
				case 1: {
					_textCenterLine1Right = Str(round((cse_ab_Kestrel4500_MAX select 1) * 10) / 10);
					_textCenterLine2Right = Str(round((cse_ab_Kestrel4500_TOTAL select 1) / (cse_ab_Kestrel4500_ENTRIES select 1) * 10) / 10);
					_textInfoLine2 = "- stop";
				};
				case 2: {
					_textCenterLine1Right = Str(round((cse_ab_Kestrel4500_MAX select 1) * 10) / 10);
					_textCenterLine2Right = Str(round((cse_ab_Kestrel4500_TOTAL select 1) / (cse_ab_Kestrel4500_ENTRIES select 1) * 10) / 10);
					_textInfoLine2 = "- clear";
				};
			};
		};
	};
	case 2: { // CROSSWIND
		if (!cse_ab_Kestrel4500_MinAvgMax) then {
			_textCenterBig = Str(round(abs(sin(cse_ab_Kestrel4500_RefHeading - _playerDir) * _windSpeed) * 10) / 10);
			_textInfoLine1 = format["%1 m/s @ %2", round((cos(_playerDir - _windDir) * _windSpeed) * 10) / 10, round(_playerDir)];
			_textInfoLine2 = "- set heading";
		} else {
			_textCenterLine1Left = "Max";
			_textCenterLine2Left = "Avg";
			switch (cse_ab_Kestrel4500_MinAvgMaxMode) do {
				case 0: {
					_textCenterLine1Right = "--. -";
					_textCenterLine2Right = "--. -";
					_textInfoLine2 = "- average";
				};
				case 1: {
					_textCenterLine1Right = Str(round((cse_ab_Kestrel4500_MAX select 2) * 10) / 10);
					_textCenterLine2Right = Str(round((cse_ab_Kestrel4500_TOTAL select 2) / (cse_ab_Kestrel4500_ENTRIES select 2) * 10) / 10);
					_textInfoLine2 = "- stop";
				};
				case 2: {
					_textCenterLine1Right = Str(round((cse_ab_Kestrel4500_MAX select 2) * 10) / 10);
					_textCenterLine2Right = Str(round((cse_ab_Kestrel4500_TOTAL select 2) / (cse_ab_Kestrel4500_ENTRIES select 2) * 10) / 10);
					_textInfoLine2 = "- clear";
				};
			};
		};
	};
	case 3: { // HEADWIND
		if (!cse_ab_Kestrel4500_MinAvgMax) then {
			_textCenterBig = Str(round(abs(cos(cse_ab_Kestrel4500_RefHeading - _playerDir) * _windSpeed) * 10) / 10);
			_textInfoLine1 = format["%1 m/s @ %2", round((cos(_playerDir - _windDir) * _windSpeed) * 10) / 10, round(_playerDir)];
			_textInfoLine2 = "- set heading";
		} else {
			_textCenterLine1Left = "Max";
			_textCenterLine2Left = "Avg";
			switch (cse_ab_Kestrel4500_MinAvgMaxMode) do {
				case 0: {
					_textCenterLine1Right = "--. -";
					_textCenterLine2Right = "--. -";
					_textInfoLine2 = "- average";
				};
				case 1: {
					_textCenterLine1Right = Str(round((cse_ab_Kestrel4500_MAX select 3) * 10) / 10);
					_textCenterLine2Right = Str(round((cse_ab_Kestrel4500_TOTAL select 3) / (cse_ab_Kestrel4500_ENTRIES select 3) * 10) / 10);
					_textInfoLine2 = "- stop";
				};
				case 2: {
					_textCenterLine1Right = Str(round((cse_ab_Kestrel4500_MAX select 3) * 10) / 10);
					_textCenterLine2Right = Str(round((cse_ab_Kestrel4500_TOTAL select 3) / (cse_ab_Kestrel4500_ENTRIES select 3) * 10) / 10);
					_textInfoLine2 = "- clear";
				};
			};
		};
	};
	case 4: { // TEMP
		if (!cse_ab_Kestrel4500_MinAvgMax) then {
			_textCenterBig = Str(round(_temperature * 10) / 10);
		} else {
			_textCenterLine1Left = "Min";
			_textCenterLine2Left = "Avg";
			_textCenterLine3Left = "Max";
			_textCenterLine1Right = Str(round((cse_ab_Kestrel4500_MIN select 4) * 10) / 10);
			_textCenterLine2Right = Str(round((cse_ab_Kestrel4500_TOTAL select 4) / (cse_ab_Kestrel4500_ENTRIES select 4) * 10) / 10);
			_textCenterLine3Right = Str(round((cse_ab_Kestrel4500_MAX select 4) * 10) / 10);
		};
	};
	case 5: { // HUMIDITY
		if (!cse_ab_Kestrel4500_MinAvgMax) then {
			_textCenterBig = Str(round(_humidity * 100 * 10) / 10);
		} else {
			_textCenterLine1Left = "Min";
			_textCenterLine2Left = "Avg";
			_textCenterLine3Left = "Max";
			_textCenterLine1Right = Str(round((cse_ab_Kestrel4500_MIN select 5) * 10) / 10);
			_textCenterLine2Right = Str(round((cse_ab_Kestrel4500_TOTAL select 5) / (cse_ab_Kestrel4500_ENTRIES select 5) * 10) / 10);
			_textCenterLine3Right = Str(round((cse_ab_Kestrel4500_MAX select 5) * 10) / 10);
		};
	};
	case 6: { // BARO
		if (!cse_ab_Kestrel4500_MinAvgMax) then {
			_textCenterBig = Str(round((1013.25 * exp(-(AB_Altitude + ((getPosASL player) select 2)) / 7990) - 10 * overcast) * 10) / 10);
		} else {
			_textCenterLine1Left = "Min";
			_textCenterLine2Left = "Avg";
			_textCenterLine3Left = "Max";
			_textCenterLine1Right = Str(round((cse_ab_Kestrel4500_MIN select 6) * 10) / 10);
			_textCenterLine2Right = Str(round((cse_ab_Kestrel4500_TOTAL select 6) / (cse_ab_Kestrel4500_ENTRIES select 6) * 10) / 10);
			_textCenterLine3Right = Str(round((cse_ab_Kestrel4500_MAX select 6) * 10) / 10);
		};
	};
	case 7: { // ALTITUDE
		if (!cse_ab_Kestrel4500_MinAvgMax) then {
			_textCenterBig = Str(round(AB_Altitude + ((getPosASL player) select 2)));
		} else {
			_textCenterLine1Left = "Min";
			_textCenterLine2Left = "Avg";
			_textCenterLine3Left = "Max";
			_textCenterLine1Right = Str(round(cse_ab_Kestrel4500_MIN select 7));
			_textCenterLine2Right = Str(round((cse_ab_Kestrel4500_TOTAL select 7) / (cse_ab_Kestrel4500_ENTRIES select 7)));
			_textCenterLine3Right = Str(round(cse_ab_Kestrel4500_MAX select 7));
		};
	};
	case 8: { // User Screen 1
		_textCenterLine1Left = Str(round(_playerDir));
		_textCenterLine2Left = Str(round(AB_Altitude + ((getPosASL player) select 2)));
		_textCenterLine3Left = Str(round(abs(_windSpeed) * 10) / 10);
		_textCenterLine1Right = cse_ab_Kestrel4500_Directions select cse_ab_Kestrel4500_Direction;
		_textCenterLine2Right = "m";
		_textCenterLine3Right = "m/s";
	};
	case 9: { // User Screen 2
		_textCenterLine1Left = Str(round(_temperature * 10) / 10);
		_textCenterLine2Left = Str(round(_humidity * 100 * 10) / 10);
		_textCenterLine3Left = Str(round((1013.25 * exp(-(AB_Altitude + ((getPosASL player) select 2)) / 7990) - 10 * overcast) * 10) / 10);
		_textCenterLine1Right = "C";
		_textCenterLine2Right = "%";
		_textCenterLine3Right = "hPA";
	};
};

[_textTop, _textCenterBig, _textCenterLine1Left, _textCenterLine2Left, _textCenterLine3Left, _textCenterLine1Right, _textCenterLine2Right, _textCenterLine3Right, _textInfoLine1, _textInfoLine2]
