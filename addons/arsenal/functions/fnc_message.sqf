#include "script_component.hpp"
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

if !(isNil "_handle") then {
    terminate _handle;
};

_handle = [_display, _messageBoxCtrl, time + 5, _message, FADE_DELAY] spawn {
    disableSerialization;

    _this params ["_display", "_control", "_timer", "_message", "_delay"];

    while {_timer >= time} do {
        switch true do {
            case (_display isEqualTo displayNull): {
                terminate _thisScript;
            };

            case (round (_timer - time) == 5): {
                _control ctrlSetText _message;
                _control ctrlSetFade 1;
                _control ctrlCommit 0;

                _control ctrlSetFade 0;
                _control ctrlCommit _delay;
            };
        };

        uiSleep 1;
    };

    _control ctrlSetFade 1;
    _control ctrlCommit _delay;
    terminate _thisScript;
};
_messageBoxCtrl setVariable [QGVAR(messageBoxHandle), _handle];
