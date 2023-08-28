// by commy2
#include "script_component.hpp"

[QGVAR(reloadStarted), {
    params ["_unit", "_target"];

    // Don't show notification if target is local AI
    if (GVAR(displayStatusText) && {!local _unit} && {_target call EFUNC(common,isPlayer)}) then {
        private _message = format [LLSTRING(LoadingStarted), _unit call EFUNC(common,getName)];

        [_message] call EFUNC(common,displayTextStructured);
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(reloadAborted), {
    params ["_unit", "_target"];

    // Don't show notification if target is local AI
    if (GVAR(displayStatusText) && {!local _unit} && {_target call EFUNC(common,isPlayer)}) then {
        private _message = format [LLSTRING(LoadingAborted), _unit call EFUNC(common,getName)];

        [_message] call EFUNC(common,displayTextStructured);
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(reloadLauncher), LINKFUNC(reloadLauncher)] call CBA_fnc_addEventHandler;
