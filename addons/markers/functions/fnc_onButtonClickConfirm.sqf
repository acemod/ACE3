#include "..\script_component.hpp"
/*
 * Author: Freddo, Daniël H., johnb43
 * When the confirm button is pressed.
 *
 * Arguments:
 * 0: Confirm button <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_buttonOk] call ACE_markers_fnc_onButtonClickConfirm
 *
 * Public: No
 */

params ["_buttonOk"];

private _display = ctrlParent _buttonOk;
private _description = _display displayCtrl IDC_INSERT_MARKER;
private _aceTimestamp = _display displayCtrl IDC_ACE_INSERT_MARKER_TIMESTAMP;

// Handle timestamp
if (cbChecked _aceTimestamp && {ACE_player call FUNC(canTimestamp)}) then {
    // Determine marker timestamp based on time settings
    private _time = switch (GVAR(timestampTimezone)) do {
        case 1: {
            systemTime select [3]
        };
        case 2: {
            systemTimeUTC params ["", "", "", "_hour", "_min", "_sec", "_msec"];

            private _hourOffset = round GVAR(timestampUTCOffset);
            _hour = _hour + _hourOffset;

            // Add or subtract minutes offset based on the negative or positive timezone
            if (GVAR(timestampUTCMinutesOffset) != 0) then {
                _min = if (_hourOffset < 0) then { _min - GVAR(timestampUTCMinutesOffset) } else { _min + GVAR(timestampUTCMinutesOffset) };

                // Add/remove extra hours from minutes
                _hour = _hour + floor (_min / 60);
                _min = (_min % 60 + 60) % 60; // ensure that minutes are between 0 and 59 (included)
            };

            [(_hour % 24 + 24) % 24, _min, _sec, _msec] // ensure that hours are between 0 and 23 (included)
        };
        default {
            private _daytime = dayTime;

            private _hour = floor _daytime;
            private _min = floor ((_daytime - _hour) * 60);
            private _sec = floor ((((_daytime - _hour) * 60) - _min) * 60);
            private _msec = floor ((((((_daytime - _hour) * 60) - _min) * 60) - _sec) * 1000);

            [_hour, _min, _sec, _msec]
        };
    };

    _time params ["_hour", "_min", "_sec", "_msec"];

    // Add timestamp suffix
    private _periodPostfix = "";

    if (GVAR(timestampHourFormat) == 12) then {
        if (_hour == 0) exitWith {
            _hour = _hour + 12;
            _periodPostfix = " am";
        };

        if (_hour == 12) exitWith {
            _periodPostfix = " pm";
        };

        if (_hour < 12) then {
            _periodPostfix = " am";
        } else {
            _hour = _hour - 12;
            _periodPostfix = " pm";
        };
    };

    private _format = switch (GVAR(timestampFormat)) do {
        case "HH": {"%1"};
        case "HH:MM": {"%1:%2"};
        case "HH:MM:SS": {"%1:%2:%3"};
        case "HH:MM:SS:MM": { // milliseconds are displayed as 0 to 59
            _msec = [_msec * 60 / 1000, 2] call CBA_fnc_formatNumber;

            "%1:%2:%3:%4"
        };
        case "HH:MM:SS.mmm": { // milliseconds are displayed as 0 to 999
            _msec = [_msec, 3] call CBA_fnc_formatNumber;

            "%1:%2:%3.%4"
        };
    };

    _time = format [
        _format,
        [_hour, 2] call CBA_fnc_formatNumber,
        [_min, 2] call CBA_fnc_formatNumber,
        [_sec, 2] call CBA_fnc_formatNumber,
        _msec
    ];

    _description ctrlSetText format [
        "%1 [%2%3]",
        ctrlText _description,
        _time,
        _periodPostfix
    ];
};
