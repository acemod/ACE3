#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineResincl.inc"

params ["_display"];
if (ctrlIDD _display != IDD_MAIN_MAP) exitWith {};

private _control = _display displayCtrl IDC_MAP;

GVAR(lastStillPosition) = _control ctrlMapScreenToWorld [0.5, 0.5];
GVAR(lastStillTime) = CBA_missionTime;
GVAR(isShaking) = false;

//map sizes are multiples of 1280
GVAR(worldSize) = worldSize / 1280;
GVAR(mousePos) = [0.5, 0.5];

//Allow panning the lastStillPosition while mapShake is active
GVAR(rightMouseButtonLastPos) = [];

_control ctrlAddEventHandler ["Draw", {_this call FUNC(updateMapEffects)}];
_control ctrlAddEventHandler ["MouseMoving", {
    params ["_control", "_x", "_y"];
    if (GVAR(isShaking) && {count GVAR(rightMouseButtonLastPos) == 2}) then {
        private _lastPos = _control ctrlMapScreenToWorld GVAR(rightMouseButtonLastPos);
        private _newPos = _control ctrlMapScreenToWorld [_x, _y];
        GVAR(lastStillPosition) set [0, (GVAR(lastStillPosition) select 0) + (_lastPos select 0) - (_newPos select 0)];
        GVAR(lastStillPosition) set [1, (GVAR(lastStillPosition) select 1) + (_lastPos select 1) - (_newPos select 1)];
        GVAR(rightMouseButtonLastPos) = [_x, _y];
        TRACE_3("Mouse Move",_lastPos,_newPos,GVAR(rightMouseButtonLastPos));
    };
}];

_control ctrlAddEventHandler ["MouseButtonDown", {
    params ["", "_button", "_x", "_y"];
    if (_button == 1) then {
        GVAR(rightMouseButtonLastPos) = [_x, _y];
    };
}];

_control ctrlAddEventHandler ["MouseButtonUp", {
    params ["", "_button"];
    if (_button == 1) then {
        GVAR(rightMouseButtonLastPos) = [];
    };
}];

//get mouse position on map
_control ctrlAddEventHandler ["MouseMoving", {
    params ["_control", "_x", "_y"];
    GVAR(mousePos) = _control ctrlMapScreenToWorld [_x, _y];
}];

_control ctrlAddEventHandler ["MouseHolding", {
    params ["_control", "_x", "_y"];
    GVAR(mousePos) = _control ctrlMapScreenToWorld [_x, _y];
}];
