#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineResincl.inc"
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

// Handle timestamp
if (cbChecked _aceTimestamp && {[ACE_player] call FUNC(canTimestamp)}) then {
    private _time = daytime;
    private _ampm = switch (true) do {
        case (GVAR(timestampHourFormat) == 24): {""};
        case (_time < 12): {" am"};
        case (_time > 12): {SUB(_time,12); " pm"};
    };

    _description ctrlSetText format [ // Add timestamp suffix
        "%1%2[%2%3]",
        ctrlText _description,
        TIMESTAMP_SPACE,
        [_time, GVAR(timestampFormat)] call BIS_fnc_timeToString,
        _ampm
    ];
};

nil
