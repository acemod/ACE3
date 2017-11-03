#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_message"];

private _messageBoxCtrl = _display displayctrl IDC_message;
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
                _control ctrlsettext _message;
                _control ctrlsetfade 1;
                _control ctrlcommit 0;

                _control ctrlsetfade 0;
                _control ctrlcommit _delay;
            };
        };

        uiSleep 1;
    };

    _control ctrlsetfade 1;
    _control ctrlcommit _delay;
    terminate _thisScript;
};
_messageBoxCtrl setVariable [QGVAR(messageBoxHandle), _handle];
