#include "script_component.hpp"

params ["_display"];

private _ctrlButtonAbort = _display displayCtrl 104;
_ctrlButtonAbort ctrlSetText localize LSTRING(Mission);
_ctrlButtonAbort ctrlSetTooltip localize LSTRING(ReturnToArsenal);

_ctrlButtonAbort ctrlSetEventHandler ["ButtonClick", {
    params ["_control"];
    ctrlParent _control closeDisplay 2;
    {[player, player, true] call FUNC(openBox)} call CBA_fnc_execNextFrame;
    true
} call EFUNC(common,codeToString)];

true
