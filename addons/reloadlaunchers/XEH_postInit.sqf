// by commy2
#include "script_component.hpp"

[QGVAR(reloadStarted), {
    private _message = format ["%1 %2", _this select 0, localize LSTRING(LoadingStarted)];
    [_message] call DEFUNC(common,displayTextStructured)
}] call CBA_fnc_addEventHandler;

[QGVAR(reloadAborted), {
    private _message = format ["%1 %2", _this select 0, localize LSTRING(LoadingAborted)];
    [_message] call DEFUNC(common,displayTextStructured)
}] call CBA_fnc_addEventHandler;

[QGVAR(reloadLauncher), {_this call DFUNC(reloadLauncher)}] call CBA_fnc_addEventHandler;
