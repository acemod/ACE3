#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe
 * Displays messages in arsenal.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Message <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display", "_message"];

private _messageBoxCtrl = _display displayCtrl IDC_message;
private _handle = _messageBoxCtrl getVariable QGVAR(messageBoxHandle);

// Stop previous message being displayed
if (!isNil "_handle") then {
    terminate _handle;
};

_handle = [_display, _messageBoxCtrl, time + 5, _message, FADE_DELAY] spawn {
    disableSerialization;

    params ["_display", "_control", "_timer", "_message", "_delay"];

    // Refresh message box, in case previous message box is still shown
    _control ctrlSetText _message;
    _control ctrlSetFade 1;
    _control ctrlCommit 0;

    _control ctrlSetFade 0;
    _control ctrlCommit _delay;

    while {_timer >= time} do {
        // If the display has been closed, quit
        if (isNull _display) then {
            terminate _thisScript;
        };

        uiSleep 1;
    };

    // Hide message box and finish
    _control ctrlSetFade 1;
    _control ctrlCommit _delay;

    terminate _thisScript;
};

_messageBoxCtrl setVariable [QGVAR(messageBoxHandle), _handle];
