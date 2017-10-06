#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_message"];

if !(isNil QGVAR(messagePFHhandle)) then {
    private _pfhHandle = missionNamespace getVariable QGVAR(messagePFHhandle);
    _pfhHandle call CBA_fnc_removePerFrameHandler;
};

private _pfhHandle = [{
    params ["_args", "_pfhID"];
    _args params ["_timer", "_display", "_control", "_message", "_delay"];

    if (_display isEqualTo displayNull) then {
       _pfhID call CBA_fnc_removePerFrameHandler;
    };

    if (_timer <= CBA_missionTime) then {
         _control ctrlsetfade 1;
         _control ctrlcommit _delay;
        _pfhID call CBA_fnc_removePerFrameHandler;
    };

    if (round (_timer - CBA_missionTime) == 5) then {
        _control ctrlsettext _message;
        _control ctrlsetfade 1;
        _control ctrlcommit 0;
        _control ctrlsetfade 0;
        _control ctrlcommit _delay;
    };
},0.5, [(CBA_missionTime + 5), _display, (_display displayctrl IDC_message), _message, FADE_DELAY]]  call CBA_fnc_addPerFrameHandler;

missionNamespace setVariable [QGVAR(messagePFHhandle), _pfhHandle];