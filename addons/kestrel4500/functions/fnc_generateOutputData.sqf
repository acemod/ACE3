/*
 * Author: Ruthberg
 * Generates the Kestrel 4500 output text.
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * [top <STRING>, centerBig <STRING>, CenterLine1Left <STRING>, CenterLine2Left <STRING>, CenterLine3Left <STRING>, CenterLine1Right <STRING>, CenterLine2Right <STRING>, CenterLine3Right <STRING>, InfoLine1 <STRING>, InfoLine2 <STRING>]
 *
 * Example:
 *
 * Public: No
 */
#include "script_component.hpp"

if (diag_tickTime - GVAR(headingSetDisplayTimer) < 0.8) exitWith {["", "", "  Heading Set", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]};

private ["_playerDir", "_playerAltitude", "_temperature", "_humidity", "_barometricPressure", "_chill", "_heatIndex", "_dewPoint", "_wetBulb", "_fnc_dayOfWeek", "_dayString", "_monthString", "_windSpeed", "_windDir", "_textTop", "_textCenterBig", "_textCenter", "_textCenterLine1Left", "_textCenterLine2Left", "_textCenterLine3Left", "_textCenterLine1Right", "_textCenterLine2Right", "_textCenterLine3Right", "_textInfoLine1", "_textInfoLine2", "_textBottomBig", "_textCenterLine1", "_textCenterLine2", "_textCenterLine3", "_textCenterLine4", "_textCenterLine5", "_textCenterLine6"];

[] call FUNC(collectData);

_textTop = GVAR(Menus) select GVAR(Menu);
_textCenterBig = "";
_textCenter = "";

_textCenterLine1Left = "";
_textCenterLine2Left = "";
_textCenterLine3Left = "";
_textCenterLine1Right = "";
_textCenterLine2Right = "";
_textCenterLine3Right = "";

_textInfoLine1 = "";
_textInfoLine2 = "";

_textBottomBig = "";

_textCenterLine1 = "";
_textCenterLine2 = "";
_textCenterLine3 = "";
_textCenterLine4 = "";
_textCenterLine5 = "";
_textCenterLine6 = "";

_windSpeed = call FUNC(measureWindSpeed);
_windDir = (ACE_wind select 0) atan2 (ACE_wind select 1);

_playerDir = getDir ACE_player;
_playerAltitude = (getPosASL ACE_player) select 2;

_temperature = _playerAltitude call EFUNC(weather,calculateTemperatureAtHeight);
_humidity = EGVAR(weather,currentHumidity);
_barometricPressure = _playerAltitude call EFUNC(weather,calculateBarometricPressure);
_chill = [_temperature, _humidity] call EFUNC(weather,calculateWindChill);
_heatIndex = [_temperature, _humidity] call EFUNC(weather,calculateHeatIndex);
_dewPoint = [_temperature, _humidity] call EFUNC(weather,calculateDewPoint);
_wetBulb = [_temperature, _barometricPressure, _humidity] call EFUNC(weather,calculateWetBulb);

_fnc_dayOfWeek = {
    private ["_year", "_month", "_day", "_table"];
    _year = _this select 0;
    _month = _this select 1;
    _day = _this select 2;
    
    _table = [0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4];
    if (_month < 3) then {
        _year = _year - 1;
    };
    (_year + floor(_year/4) - floor(_year/100) + floor(_year/400) + (_table select (_month - 1)) + _day) % 7
};

GVAR(Direction) = 4 * floor(_playerDir / 90);
if (_playerDir % 90 > 10) then { GVAR(Direction) = GVAR(Direction) + 1};
if (_playerDir % 90 > 35) then { GVAR(Direction) = GVAR(Direction) + 1};
if (_playerDir % 90 > 55) then { GVAR(Direction) = GVAR(Direction) + 1};
if (_playerDir % 90 > 80) then { GVAR(Direction) = GVAR(Direction) + 1};
GVAR(Direction) = GVAR(Direction) % 16;

if (GVAR(referenceHeadingMenu) == 0) then {
    switch (GVAR(Menu)) do {
        case 0: { // Date
            EXPLODE_3_PVT(date,_year,_month,_day);
            _dayString = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"] select (date call _fnc_dayOfWeek);
            _monthString = localize (["str_january","str_february","str_march","str_april","str_may","str_june","str_july","str_august","str_september","str_october","str_november","str_december"] select (_month - 1));
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
                _textCenterBig = Str(round(abs(_windSpeed) * 10) / 10);
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
                    _textInfoLine1 = format["%1 m/s @ %2", round((abs(cos(_playerDir - _windDir)) * _windSpeed) * 10) / 10, round(_playerDir)];
                } else {
                    _textCenterBig = Str(round(abs(sin(GVAR(RefHeading)) * _windSpeed) * 10) / 10);
                    _textInfoLine1 = format["%1 m/s @ %2", round(_windSpeed * 10) / 10, round(_windDir)];
                };
                _textInfoLine2 = "- set heading";
            } else {
                _textCenterLine1Left = "Max";
                _textCenterLine2Left = "Avg";
                switch (GVAR(MinAvgMax)Mode) do {
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
                    _textCenterBig = Str(round(abs(cos(GVAR(RefHeading) - _playerDir) * _windSpeed) * 10) / 10);
                    _textInfoLine1 = format["%1 m/s @ %2", round((abs(cos(_playerDir - _windDir)) * _windSpeed) * 10) / 10, round(_playerDir)];
                } else {
                    _textCenterBig = Str(round(abs(cos(GVAR(RefHeading)) * _windSpeed) * 10) / 10);
                    _textInfoLine1 = format["%1 m/s @ %2", round(_windSpeed * 10) / 10, round(_windDir)];
                };
                _textInfoLine2 = "- set heading";
            } else {
                _textCenterLine1Left = "Max";
                _textCenterLine2Left = "Avg";
                switch (GVAR(MinAvgMax)Mode) do {
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
                _textCenterBig = Str(round(EGVAR(weather,Altitude) + _playerAltitude));
            } else {
                _textCenterLine1Left = "Min";
                _textCenterLine2Left = "Avg";
                _textCenterLine3Left = "Max";
                _textCenterLine1Right = Str(round(GVAR(Min) select 12));
                _textCenterLine2Right = Str(round((GVAR(Total) select 12) / (GVAR(Entries) select 12)));
                _textCenterLine3Right = Str(round(GVAR(Max) select 12));
            };
        };
        case 13: { // User Screen 1
            _textCenterLine1Left = Str(round(_playerDir));
            _textCenterLine2Left = Str(round(EGVAR(weather,Altitude) + _playerAltitude));
            _textCenterLine3Left = Str(round(abs(_windSpeed) * 10) / 10);
            _textCenterLine1Right = GVAR(Directions) select GVAR(Direction);
            _textCenterLine2Right = "m";
            _textCenterLine3Right = "m/s";
        };
        case 14: { // User Screen 2
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
