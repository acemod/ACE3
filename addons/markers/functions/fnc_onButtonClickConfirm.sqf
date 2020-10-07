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

// Handle timestamp
if (GETUVAR(GVAR(timestampChecked),false) && {[ACE_player] call FUNC(canTimestamp)}) then {
    private _description = (ctrlParent _buttonOk) displayctrl IDC_INSERT_MARKER;
    private _time = daytime;
    private _ampm = switch (true) do {
        case (GVAR(timestampHourFormat) == 24): {""};
        case (_time < 12): {" am"};
        case (_time > 12): {SUB(_time,12); " pm"};
    };

    _description ctrlSetText format [ // Add timestamp suffix
        "%1 [%2%3]",
        ctrlText _description,
        [_time, GVAR(timestampFormat)] call BIS_fnc_timeToString,
        _ampm
    ];
};

nil
