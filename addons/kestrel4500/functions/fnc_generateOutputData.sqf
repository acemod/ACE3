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
#include "defines.h"

private ["_playerDir", "_textTop", "_textCenterBig", "_textCenterLine1Left", "_textCenterLine2Left", "_textCenterLine3Left", "_textCenterLine1Right", "_textCenterLine2Right", "_textCenterLine3Right", "_textInfoLine1", "_textInfoLine2", "_temperature", "_humidity", "_windSpeed", "_windDir", "_newWindSpeed", "_windSource", "_height"];

if (isNil QUOTE(EGVAR(advanced_ballistics,Altitude))) then {EGVAR(advanced_ballistics,Altitude) = 0};

[] call FUNC(collectData);

_textTop = GVAR(Kestrel4500_Menus) select GVAR(Kestrel4500_Menu);
_textCenterBig = "";

_textCenterLine1Left = "";
_textCenterLine2Left = "";
_textCenterLine3Left = "";
_textCenterLine1Right = "";
_textCenterLine2Right = "";
_textCenterLine3Right = "";

_textInfoLine1 = "";
_textInfoLine2 = "";

_windSpeed = vectorMagnitude ACE_wind;
_windDir = (ACE_wind select 0) atan2 (ACE_wind select 1);

_temperature = GET_TEMPERATURE_AT_HEIGHT((getPosASL ACE_player) select 2);
_humidity = EGVAR(weather,currentHumidity);

if (isClass (configFile >> "CfgPatches" >> "ACE_Advanced_Ballistics")) then {
    _windSpeed = (eyePos ACE_player) call EFUNC(advanced_ballistics,calculateWindSpeed);
};

_playerDir = getDir ACE_player;
_windSpeed = cos(_playerDir - _windDir) * _windSpeed;

GVAR(Kestrel4500_Direction) = 4 * floor(_playerDir / 90);
if (_playerDir % 90 > 10) then { GVAR(Kestrel4500_Direction) = GVAR(Kestrel4500_Direction) + 1};
if (_playerDir % 90 > 35) then { GVAR(Kestrel4500_Direction) = GVAR(Kestrel4500_Direction) + 1};
if (_playerDir % 90 > 55) then { GVAR(Kestrel4500_Direction) = GVAR(Kestrel4500_Direction) + 1};
if (_playerDir % 90 > 80) then { GVAR(Kestrel4500_Direction) = GVAR(Kestrel4500_Direction) + 1};
GVAR(Kestrel4500_Direction) = GVAR(Kestrel4500_Direction) % 16;

switch (GVAR(Kestrel4500_Menu)) do {
    case 0: { // Direction
        if (!GVAR(Kestrel4500_MinAvgMax)) then {
            _textCenterBig = format["%1", format["%1 %2", GVAR(Kestrel4500_Direction)s select GVAR(Kestrel4500_Direction), round(_playerDir)]];
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
        if (!GVAR(Kestrel4500_MinAvgMax)) then {
            _textCenterBig = Str(round(abs(_windSpeed) * 10) / 10);
        } else {
            _textCenterLine1Left = "Max";
            _textCenterLine2Left = "Avg";
            switch (GVAR(Kestrel4500_MinAvgMaxMode)) do {
                case 0: {
                    _textCenterLine1Right = "--. -";
                    _textCenterLine2Right = "--. -";
                    _textInfoLine2 = "- average";
                };
                case 1: {
                    _textCenterLine1Right = Str(round((Kestrel4500_MAX select 1) * 10) / 10);
                    _textCenterLine2Right = Str(round((Kestrel4500_TOTAL select 1) / (Kestrel4500_ENTRIES select 1) * 10) / 10);
                    _textInfoLine2 = "- stop";
                };
                case 2: {
                    _textCenterLine1Right = Str(round((Kestrel4500_MAX select 1) * 10) / 10);
                    _textCenterLine2Right = Str(round((Kestrel4500_TOTAL select 1) / (Kestrel4500_ENTRIES select 1) * 10) / 10);
                    _textInfoLine2 = "- clear";
                };
            };
        };
    };
    case 2: { // CROSSWIND
        if (!GVAR(Kestrel4500_MinAvgMax)) then {
            _textCenterBig = Str(round(abs(sin(GVAR(Kestrel4500_RefHeading) - _playerDir) * _windSpeed) * 10) / 10);
            _textInfoLine1 = format["%1 m/s @ %2", round((cos(_playerDir - _windDir) * _windSpeed) * 10) / 10, round(_playerDir)];
            _textInfoLine2 = "- set heading";
        } else {
            _textCenterLine1Left = "Max";
            _textCenterLine2Left = "Avg";
            switch (GVAR(Kestrel4500_MinAvgMax)Mode) do {
                case 0: {
                    _textCenterLine1Right = "--. -";
                    _textCenterLine2Right = "--. -";
                    _textInfoLine2 = "- average";
                };
                case 1: {
                    _textCenterLine1Right = Str(round((Kestrel4500_MAX select 2) * 10) / 10);
                    _textCenterLine2Right = Str(round((Kestrel4500_TOTAL select 2) / (Kestrel4500_ENTRIES select 2) * 10) / 10);
                    _textInfoLine2 = "- stop";
                };
                case 2: {
                    _textCenterLine1Right = Str(round((Kestrel4500_MAX select 2) * 10) / 10);
                    _textCenterLine2Right = Str(round((Kestrel4500_TOTAL select 2) / (Kestrel4500_ENTRIES select 2) * 10) / 10);
                    _textInfoLine2 = "- clear";
                };
            };
        };
    };
    case 3: { // HEADWIND
        if (!GVAR(Kestrel4500_MinAvgMax)) then {
            _textCenterBig = Str(round(abs(cos(GVAR(Kestrel4500_RefHeading) - _playerDir) * _windSpeed) * 10) / 10);
            _textInfoLine1 = format["%1 m/s @ %2", round((cos(_playerDir - _windDir) * _windSpeed) * 10) / 10, round(_playerDir)];
            _textInfoLine2 = "- set heading";
        } else {
            _textCenterLine1Left = "Max";
            _textCenterLine2Left = "Avg";
            switch (GVAR(Kestrel4500_MinAvgMax)Mode) do {
                case 0: {
                    _textCenterLine1Right = "--. -";
                    _textCenterLine2Right = "--. -";
                    _textInfoLine2 = "- average";
                };
                case 1: {
                    _textCenterLine1Right = Str(round((Kestrel4500_MAX select 3) * 10) / 10);
                    _textCenterLine2Right = Str(round((Kestrel4500_TOTAL select 3) / (Kestrel4500_ENTRIES select 3) * 10) / 10);
                    _textInfoLine2 = "- stop";
                };
                case 2: {
                    _textCenterLine1Right = Str(round((Kestrel4500_MAX select 3) * 10) / 10);
                    _textCenterLine2Right = Str(round((Kestrel4500_TOTAL select 3) / (Kestrel4500_ENTRIES select 3) * 10) / 10);
                    _textInfoLine2 = "- clear";
                };
            };
        };
    };
    case 4: { // TEMP
        if (!GVAR(Kestrel4500_MinAvgMax)) then {
            _textCenterBig = Str(round(_temperature * 10) / 10);
        } else {
            _textCenterLine1Left = "Min";
            _textCenterLine2Left = "Avg";
            _textCenterLine3Left = "Max";
            _textCenterLine1Right = Str(round((Kestrel4500_MIN select 4) * 10) / 10);
            _textCenterLine2Right = Str(round((Kestrel4500_TOTAL select 4) / (Kestrel4500_ENTRIES select 4) * 10) / 10);
            _textCenterLine3Right = Str(round((Kestrel4500_MAX select 4) * 10) / 10);
        };
    };
    case 5: { // HUMIDITY
        if (!GVAR(Kestrel4500_MinAvgMax)) then {
            _textCenterBig = Str(round(_humidity * 100 * 10) / 10);
        } else {
            _textCenterLine1Left = "Min";
            _textCenterLine2Left = "Avg";
            _textCenterLine3Left = "Max";
            _textCenterLine1Right = Str(round((Kestrel4500_MIN select 5) * 10) / 10);
            _textCenterLine2Right = Str(round((Kestrel4500_TOTAL select 5) / (Kestrel4500_ENTRIES select 5) * 10) / 10);
            _textCenterLine3Right = Str(round((Kestrel4500_MAX select 5) * 10) / 10);
        };
    };
    case 6: { // BARO
        if (!GVAR(Kestrel4500_MinAvgMax)) then {
            _textCenterBig = Str(round((1013.25 * exp(-(EGVAR(advanced_ballistics,Altitude) + ((getPosASL ACE_player) select 2)) / 7990) - 10 * overcast) * 10) / 10);
        } else {
            _textCenterLine1Left = "Min";
            _textCenterLine2Left = "Avg";
            _textCenterLine3Left = "Max";
            _textCenterLine1Right = Str(round((Kestrel4500_MIN select 6) * 10) / 10);
            _textCenterLine2Right = Str(round((Kestrel4500_TOTAL select 6) / (Kestrel4500_ENTRIES select 6) * 10) / 10);
            _textCenterLine3Right = Str(round((Kestrel4500_MAX select 6) * 10) / 10);
        };
    };
    case 7: { // ALTITUDE
        if (!GVAR(Kestrel4500_MinAvgMax)) then {
            _textCenterBig = Str(round(EGVAR(advanced_ballistics,Altitude) + ((getPosASL ACE_player) select 2)));
        } else {
            _textCenterLine1Left = "Min";
            _textCenterLine2Left = "Avg";
            _textCenterLine3Left = "Max";
            _textCenterLine1Right = Str(round(Kestrel4500_MIN select 7));
            _textCenterLine2Right = Str(round((Kestrel4500_TOTAL select 7) / (Kestrel4500_ENTRIES select 7)));
            _textCenterLine3Right = Str(round(Kestrel4500_MAX select 7));
        };
    };
    case 8: { // User Screen 1
        _textCenterLine1Left = Str(round(_playerDir));
        _textCenterLine2Left = Str(round(EGVAR(advanced_ballistics,Altitude) + ((getPosASL ACE_player) select 2)));
        _textCenterLine3Left = Str(round(abs(_windSpeed) * 10) / 10);
        _textCenterLine1Right = GVAR(Kestrel4500_Direction)s select GVAR(Kestrel4500_Direction);
        _textCenterLine2Right = "m";
        _textCenterLine3Right = "m/s";
    };
    case 9: { // User Screen 2
        _textCenterLine1Left = Str(round(_temperature * 10) / 10);
        _textCenterLine2Left = Str(round(_humidity * 100 * 10) / 10);
        _textCenterLine3Left = Str(round((1013.25 * exp(-(EGVAR(advanced_ballistics,Altitude) + ((getPosASL ACE_player) select 2)) / 7990) - 10 * overcast) * 10) / 10);
        _textCenterLine1Right = "C";
        _textCenterLine2Right = "%";
        _textCenterLine3Right = "hPA";
    };
};

[_textTop, _textCenterBig, _textCenterLine1Left, _textCenterLine2Left, _textCenterLine3Left, _textCenterLine1Right, _textCenterLine2Right, _textCenterLine3Right, _textInfoLine1, _textInfoLine2]
