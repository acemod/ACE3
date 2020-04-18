#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineResincl.inc"

params ["_display"];
TRACE_1("initMainMap",_display);
if (ctrlIDD _display != IDD_MAIN_MAP) exitWith {};

private _control = _display displayCtrl IDC_MAP;

GVAR(lastStillPosition) = _control ctrlMapScreenToWorld [0.5, 0.5];
[{
    if (!GVAR(isShaking)) then { // player map position won't be correct until a frame later
        GVAR(lastStillPosition) = _this ctrlMapScreenToWorld [0.5, 0.5];
    };
}, _control] call CBA_fnc_execNextFrame;

GVAR(lastStillTime) = CBA_missionTime;
GVAR(isShaking) = false;

//map sizes are multiples of 1280
GVAR(worldSize) = worldSize / 1280;
GVAR(mousePos) = [0.5, 0.5];

//Allow panning the lastStillPosition while mapShake is active
GVAR(rightMouseButtonLastPos) = [];
