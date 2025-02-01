#include "script_component.hpp"

#include "initKeybinds.inc.sqf"

//#TODO this is leftover and not used, could be useful though
[QGVAR(loadApp), {
    params ["_classname","_display"];
    [_display, _classname] call FUNC(switchToApp);
}] call CBA_fnc_addEventHandler;