#include "..\script_component.hpp"
/*
 * Author: mharis001
 * Updates list control with given logs.
 *
 * Arguments:
 * 0: Log list <CONTROL>
 * 1: Log to add <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_ctrlActivityLog, _activityLog] call ace_medical_gui_fnc_updateLogList
 *
 * Public: No
 */

params ["_ctrl", "_logs"];

lbClear _ctrl;

{
    _x params ["_message", "_timeStamp", "_arguments"];

    private _unlocalizedMessage = _message;

    // Localize message and arguments
    if (isLocalized _message) then {
        _message = localize _message;
    };

    _arguments = _arguments apply {if (_x isEqualType "" && {isLocalized _x}) then {localize _x} else {_x}};

    // Format message with arguments
    _message = format ([_message] + _arguments);

    private _row = _ctrl lbAdd format ["%1 %2", _timeStamp, _message];

    [QGVAR(logListAppended), [_ctrl, _row, _message, _unlocalizedMessage, _timeStamp, _arguments]] call CBA_fnc_localEvent;
} forEach _logs;
