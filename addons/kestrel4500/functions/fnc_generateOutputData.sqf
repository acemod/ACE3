#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Generates the Kestrel 4500 output text.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: top <STRING>
 * 1: centerBig <STRING>
 * 2: CenterLine1Left <STRING>
 * 3: CenterLine2Left <STRING>
 * 4: CenterLine3Left <STRING>
 * 5: CenterLine1Right <STRING>
 * 6: CenterLine2Right <STRING>
 * 7: CenterLine3Right <STRING>
 * 8: InfoLine1 <STRING>
 * 9: InfoLine2 <STRING>
 * 10: Bottom Big <STRING>
 * 11: Center Line 1 <STRING>
 * 11: Center Line 2 <STRING>
 * 12: Center Line 3 <STRING>
 * 13: Center Line 4 <STRING>
 * 14: Center Line 5 <STRING>
 * 15: Center Line 6 <STRING>
 *
 * Example:
 * _var = call ace_kestrel4500_fnc_generateOutputData
 *
 * Public: No
 */

if (diag_tickTime - GVAR(headingSetDisplayTimer) < 0.8) exitWith {["", "", "  Heading Set", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]};

[] call FUNC(collectData);

private _textTop = GVAR(Menus) select GVAR(Menu);
private _textCenterBig = "";
private _textCenter = "";

private _textCenterLine1Left = "";
private _textCenterLine2Left = "";
private _textCenterLine3Left = "";
private _textCenterLine1Right = "";
private _textCenterLine2Right = "";
private _textCenterLine3Right = "";

private _textInfoLine1 = "";
private _textInfoLine2 = "";

private _textBottomBig = "";

private _textCenterLine1 = "";
private _textCenterLine2 = "";
private _textCenterLine3 = "";
private _textCenterLine4 = "";
private _textCenterLine5 = "";
private _textCenterLine6 = "";

private _windSpeed = call FUNC(measureWindSpeed);
private _windDir = (wind select 0) atan2 (wind select 1);

private _playerDir = getDir ACE_player;
private _playerAltitude = (getPosASL ACE_player) select 2;

private _temperature = _playerAltitude call EFUNC(weather,calculateTemperatureAtHeight);
private _humidity = EGVAR(weather,currentHumidity);
private _barometricPressure = _playerAltitude call EFUNC(weather,calculateBarometricPressure);
private _airDensity = [_temperature, _barometricPressure, _humidity] call EFUNC(weather,calculateAirDensity);
private _densityAltitude = _airDensity call EFUNC(weather,calculateDensityAltitude);
private _chill = [_temperature, _humidity] call EFUNC(weather,calculateWindChill);
private _heatIndex = [_temperature, _humidity] call EFUNC(weather,calculateHeatIndex);
private _dewPoint = [_temperature, _humidity] call EFUNC(weather,calculateDewPoint);
private _wetBulb = [_temperature, _barometricPressure, _humidity] call EFUNC(weather,calculateWetBulb);

GVAR(Direction) = 4 * floor(_playerDir / 90);
if (_playerDir % 90 > 10) then { GVAR(Direction) = GVAR(Direction) + 1};
if (_playerDir % 90 > 35) then { GVAR(Direction) = GVAR(Direction) + 1};
if (_playerDir % 90 > 55) then { GVAR(Direction) = GVAR(Direction) + 1};
if (_playerDir % 90 > 80) then { GVAR(Direction) = GVAR(Direction) + 1};
GVAR(Direction) = GVAR(Direction) % 16;

if (GVAR(referenceHeadingMenu) == 0) then {
    switch (GVAR(Menu)) do {
        case 0: { // Date
            date params ["_year", "_month", "_day"];
            private _dayString = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"] select (date call FUNC(dayOfWeek));
            private _monthString = localize (["str_january","str_february","str_march","str_april","str_may","str_june","str_july","str_august","str_september","str_october","str_november","str_december"] select (_month - 1));
            _textTop = _dayString;
            _textCenter = format["%1 %2 %3", _day, _monthString, _year];
            _textBottomBig = [daytime, "HH:MM:SS"] call bis_fnc_timeToString;
        };
        case 1: { // Direction
            if (!GVAR(MinAvgMax)) then {
                _textCenterBig = format["%1", format["%1 %2", GVAR(Directions) select GVAR(Direction), round(_playerDir)]];
            } else {
                _textCenterLine1Left = "Min";
                _textCenterLine2Left = "Avg";
                _textCenterLine3Left = "Max";
                _textCenterLine1Right = "N/A";
                _textCenterLine2Right = "N/A";
                _textCenterLine3Right = "N/A";
            };
        };
        case 2: { // Wind SPD
            if (!GVAR(MinAvgMax)) then {
                _textCenterBig = Str(round(_windSpeed * 10) / 10);
            } else {
                _textCenterLine1Left = "Max";
                _textCenterLine2Left = "Avg";
                switch (GVAR(MinAvgMaxMode)) do {
                    case 0: {
                        _textCenterLine1Right = "--. -";
                        _textCenterLine2Right = "--. -";
                        _textInfoLine2 = "- average";
                    };
                    case 1: {
                        _textCenterLine1Right = Str(round((GVAR(Max) select 2) * 10) / 10);
                        _textCenterLine2Right = Str(round((GVAR(Total) select 2) / (GVAR(Entries) select 2) * 10) / 10);
                        _textInfoLine2 = "- stop";
                    };
                    case 2: {
                        _textCenterLine1Right = Str(round((GVAR(Max) select 2) * 10) / 10);
                        _textCenterLine2Right = Str(round((GVAR(Total) select 2) / (GVAR(Entries) select 2) * 10) / 10);
                        _textInfoLine2 = "- clear";
                    };
                };
            };
        };
        case 3: { // CROSSWIND
            if (!GVAR(MinAvgMax)) then {
                if (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) then {
                    _textCenterBig = Str(round(abs(sin(GVAR(RefHeading) - _playerDir) * _windSpeed) * 10) / 10);
                    _textInfoLine1 = format["%1 m/s @ %2", round(_windSpeed * 10) / 10, round(_playerDir)];
                } else {
                    _textCenterBig = Str(round(abs(sin(GVAR(RefHeading) - _windDir) * _windSpeed) * 10) / 10);
                    _textInfoLine1 = format["%1 m/s @ %2", round(_windSpeed * 10) / 10, round(180 + _windDir)];
                };
                _textInfoLine2 = "- set heading";
            } else {
                _textCenterLine1Left = "Max";
                _textCenterLine2Left = "Avg";
                switch (GVAR(MinAvgMaxMode)) do {
                    case 0: {
                        _textCenterLine1Right = "--. -";
                        _textCenterLine2Right = "--. -";
                        _textInfoLine2 = "- average";
                    };
                    case 1: {
                        _textCenterLine1Right = Str(round((GVAR(Max) select 3) * 10) / 10);
                        _textCenterLine2Right = Str(round((GVAR(Total) select 3) / (GVAR(Entries) select 3) * 10) / 10);
                        _textInfoLine2 = "- stop";
                    };
                    case 2: {
                        _textCenterLine1Right = Str(round((GVAR(Max) select 3) * 10) / 10);
                        _textCenterLine2Right = Str(round((GVAR(Total) select 3) / (GVAR(Entries) select 3) * 10) / 10);
                        _textInfoLine2 = "- clear";
                    };
                };
            };
        };
        case 4: { // HEADWIND
            if (!GVAR(MinAvgMax)) then {
                if (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) then {
                    _textCenterBig = Str(round(cos(GVAR(RefHeading) - _playerDir) * _windSpeed * 10) / 10);
                    _textInfoLine1 = format["%1 m/s @ %2", round(_windSpeed * 10) / 10, round(_playerDir)];
                } else {
                    _textCenterBig = Str(round(-cos(GVAR(RefHeading) - _windDir) * _windSpeed * 10) / 10);
                    _textInfoLine1 = format["%1 m/s @ %2", round(_windSpeed * 10) / 10, round(180 + _windDir)];
                };
                _textInfoLine2 = "- set heading";
            } else {
                _textCenterLine1Left = "Max";
                _textCenterLine2Left = "Avg";
                switch (GVAR(MinAvgMaxMode)) do {
                    case 0: {
                        _textCenterLine1Right = "--. -";
                        _textCenterLine2Right = "--. -";
                        _textInfoLine2 = "- average";
                    };
                    case 1: {
                        _textCenterLine1Right = Str(round((GVAR(Max) select 4) * 10) / 10);
                        _textCenterLine2Right = Str(round((GVAR(Total) select 4) / (GVAR(Entries) select 4) * 10) / 10);
                        _textInfoLine2 = "- stop";
                    };
                    case 2: {
                        _textCenterLine1Right = Str(round((GVAR(Max) select 4) * 10) / 10);
                        _textCenterLine2Right = Str(round((GVAR(Total) select 4) / (GVAR(Entries) select 4) * 10) / 10);
                        _textInfoLine2 = "- clear";
                    };
                };
            };
        };
        case 5: { // TEMP
            if (!GVAR(MinAvgMax)) then {
                _textCenterBig = Str(round(_temperature * 10) / 10);
            } else {
                _textCenterLine1Left = "Min";
                _textCenterLine2Left = "Avg";
                _textCenterLine3Left = "Max";
                _textCenterLine1Right = Str(round((GVAR(Min) select 5) * 10) / 10);
                _textCenterLine2Right = Str(round((GVAR(Total) select 5) / (GVAR(Entries) select 5) * 10) / 10);
                _textCenterLine3Right = Str(round((GVAR(Max) select 5) * 10) / 10);
            };
        };
        case 6: { // CHILL
            if (!GVAR(MinAvgMax)) then {
                _textCenterBig = Str(round(_chill * 10) / 10);
            } else {
                _textCenterLine1Left = "Min";
                _textCenterLine2Left = "Avg";
                _textCenterLine3Left = "Max";
                _textCenterLine1Right = Str(round((GVAR(Min) select 6) * 10) / 10);
                _textCenterLine2Right = Str(round((GVAR(Total) select 6) / (GVAR(Entries) select 6) * 10) / 10);
                _textCenterLine3Right = Str(round((GVAR(Max) select 6) * 10) / 10);
            };
        };
        case 7: { // HUMIDITY
            if (!GVAR(MinAvgMax)) then {
                _textCenterBig = Str(round(_humidity * 100 * 10) / 10);
            } else {
                _textCenterLine1Left = "Min";
                _textCenterLine2Left = "Avg";
                _textCenterLine3Left = "Max";
                _textCenterLine1Right = Str(round((GVAR(Min) select 7) * 100 * 10) / 10);
                _textCenterLine2Right = Str(round((GVAR(Total) select 7) / (GVAR(Entries) select 7) * 100 * 10) / 10);
                _textCenterLine3Right = Str(round((GVAR(Max) select 7) * 100 * 10) / 10);
            };
        };
        case 8: { // HEAT INDEX
            if (!GVAR(MinAvgMax)) then {
                _textCenterBig = Str(round(_heatIndex * 10) / 10);
            } else {
                _textCenterLine1Left = "Min";
                _textCenterLine2Left = "Avg";
                _textCenterLine3Left = "Max";
                _textCenterLine1Right = Str(round((GVAR(Min) select 8) * 10) / 10);
                _textCenterLine2Right = Str(round((GVAR(Total) select 8) / (GVAR(Entries) select 8) * 10) / 10);
                _textCenterLine3Right = Str(round((GVAR(Max) select 8) * 10) / 10);
            };
        };
        case 9: { // DEW POINT
            if (!GVAR(MinAvgMax)) then {
                _textCenterBig = Str(round(_dewPoint * 10) / 10);
            } else {
                _textCenterLine1Left = "Min";
                _textCenterLine2Left = "Avg";
                _textCenterLine3Left = "Max";
                _textCenterLine1Right = Str(round((GVAR(Min) select 9) * 10) / 10);
                _textCenterLine2Right = Str(round((GVAR(Total) select 9) / (GVAR(Entries) select 9) * 10) / 10);
                _textCenterLine3Right = Str(round((GVAR(Max) select 9) * 10) / 10);
            };
        };
        case 10: { // WET BULB
            if (!GVAR(MinAvgMax)) then {
                _textCenterBig = Str(round(_wetBulb * 10) / 10);
            } else {
                _textCenterLine1Left = "Min";
                _textCenterLine2Left = "Avg";
                _textCenterLine3Left = "Max";
                _textCenterLine1Right = Str(round((GVAR(Min) select 10) * 10) / 10);
                _textCenterLine2Right = Str(round((GVAR(Total) select 10) / (GVAR(Entries) select 10) * 10) / 10);
                _textCenterLine3Right = Str(round((GVAR(Max) select 10) * 10) / 10);
            };
        };
        case 11: { // BARO
            if (!GVAR(MinAvgMax)) then {
                _textCenterBig = Str(round(_barometricPressure * 10) / 10);
            } else {
                _textCenterLine1Left = "Min";
                _textCenterLine2Left = "Avg";
                _textCenterLine3Left = "Max";
                _textCenterLine1Right = Str(round((GVAR(Min) select 11) * 10) / 10);
                _textCenterLine2Right = Str(round((GVAR(Total) select 11) / (GVAR(Entries) select 11) * 10) / 10);
                _textCenterLine3Right = Str(round((GVAR(Max) select 11) * 10) / 10);
            };
        };
        case 12: { // ALTITUDE
            if (!GVAR(MinAvgMax)) then {
                _textCenterBig = Str(round(EGVAR(common,mapAltitude) + _playerAltitude));
            } else {
                _textCenterLine1Left = "Min";
                _textCenterLine2Left = "Avg";
                _textCenterLine3Left = "Max";
                _textCenterLine1Right = Str(round(GVAR(Min) select 12));
                _textCenterLine2Right = Str(round((GVAR(Total) select 12) / (GVAR(Entries) select 12)));
                _textCenterLine3Right = Str(round(GVAR(Max) select 12));
            };
        };
        case 13: { // DENSITY ALTITUDE
            if (!GVAR(MinAvgMax)) then {
                _textCenterBig = Str(round(_densityAltitude));
            } else {
                _textCenterLine1Left = "Min";
                _textCenterLine2Left = "Avg";
                _textCenterLine3Left = "Max";
                _textCenterLine1Right = Str(round(GVAR(Min) select 13));
                _textCenterLine2Right = Str(round((GVAR(Total) select 13) / (GVAR(Entries) select 13)));
                _textCenterLine3Right = Str(round(GVAR(Max) select 13));
            };
        };
        case 14: { // User Screen 1
            _textCenterLine1Left = Str(round(_playerDir));
            _textCenterLine2Left = Str(round(EGVAR(common,mapAltitude) + _playerAltitude));
            _textCenterLine3Left = Str(round(abs(_windSpeed) * 10) / 10);
            _textCenterLine1Right = GVAR(Directions) select GVAR(Direction);
            _textCenterLine2Right = "m";
            _textCenterLine3Right = "m/s";
        };
        case 15: { // User Screen 2
            _textCenterLine1Left = Str(round(_temperature * 10) / 10);
            _textCenterLine2Left = Str(round(_humidity * 100 * 10) / 10);
            _textCenterLine3Left = Str(round((_playerAltitude call EFUNC(weather,calculateBarometricPressure)) * 10) / 10);
            _textCenterLine1Right = "C";
            _textCenterLine2Right = "%";
            _textCenterLine3Right = "hPA";
        };
    };
} else {
    _textTop = "";
    switch (GVAR(referenceHeadingMenu)) do {
        case 1: {
            _textCenterLine1 = "MAGNETIC  HEADING";
            _textCenterLine2 = Str(round(GVAR(RefHeading)));
            _textCenterLine3 = "Auto Set           ";
            _textCenterLine4 = "Manual Set         ";
            _textCenterLine5 = "================";
            _textCenterLine6 = "- select  (|) exit";
        };
        case 2: {
            _textCenterLine1 = "MAGNETIC  HEADING";
            _textCenterLine2 = Str(round(_playerDir));
            _textCenterLine3 = "Point Down the";
            _textCenterLine4 = "Runway or Range";
            _textCenterLine5 = "================";
            _textCenterLine6 = "- set heading";
        };
        case 3: {
            _textCenterLine1 = "MAGNETIC  HEADING";
            _textCenterLine2 = Str(round(GVAR(TmpHeading)));
            _textCenterLine3 = "Press < and >";
            _textCenterLine4 = "to Adjust";
            _textCenterLine5 = "================";
            _textCenterLine6 = "- set heading";
        };
    };
};

[_textTop, _textCenterBig, _textCenter, _textCenterLine1Left, _textCenterLine2Left, _textCenterLine3Left, _textCenterLine1Right, _textCenterLine2Right, _textCenterLine3Right, _textInfoLine1, _textInfoLine2, _textBottomBig, _textCenterLine1, _textCenterLine2, _textCenterLine3, _textCenterLine4, _textCenterLine5, _textCenterLine6]
