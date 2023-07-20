#include "script_component.hpp"
/*
 * Author: Freddo
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
private _description = _display displayctrl IDC_INSERT_MARKER;
private _aceTimestamp = _display displayCtrl IDC_ACE_INSERT_MARKER_TIMESTAMP;

// handle timestamp
if (cbChecked _aceTimestamp && {ACE_player call FUNC(canTimestamp)}) then {
    private _time = daytime;

    // add timestamp suffix
    private _periodPostfix = "";
    if (GVAR(timestampHourFormat) == 12) then {
        if (floor _time == 0) exitWith {
            _time = _time + 12;
            _periodPostfix = " am";
        };

        if (floor _time == 12) exitWith {
            _periodPostfix = " pm";
        };

        if (_time < 12) then {
            _periodPostfix = " am";
        } else {
            _time = _time - 12;
            _periodPostfix = " pm";
        };
    };

    _description ctrlSetText format [
        "%1 [%2%3]",
        ctrlText _description,
        [_time, GVAR(timestampFormat)] call BIS_fnc_timeToString,
        _periodPostfix
    ];
};
