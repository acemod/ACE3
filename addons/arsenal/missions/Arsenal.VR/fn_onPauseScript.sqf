#include "script_component.hpp"

params ["_display"];

private _ctrlButtonAbort = _display displayCtrl 104;
_ctrlButtonAbort ctrlSetText localize LSTRING(Mission);
_ctrlButtonAbort ctrlSetEventHandler [
    "ButtonClick", {
        params ["_control"];
        ctrlParent _control closeDisplay 2;
        ["Open", true] spawn (uiNamespace getVariable "bis_fnc_arsenal"); //@todo
        true
    } call EFUNC(common,codeToString)
];

true
