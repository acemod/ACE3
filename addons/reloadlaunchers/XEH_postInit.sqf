// by commy2
#include "script_component.hpp"

[QGVAR(reloadStarted), {
    if GVAR(displayStatusText) then {
        private _message = format [localize LSTRING(LoadingStarted), _this select 0];
        [_message] call DEFUNC(common,displayTextStructured)
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(reloadAborted), {
    if GVAR(displayStatusText) then {
        private _message = format [localize LSTRING(LoadingAborted), _this select 0];
        [_message] call DEFUNC(common,displayTextStructured)
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(reloadLauncher), {_this call DFUNC(reloadLauncher)}] call CBA_fnc_addEventHandler;
