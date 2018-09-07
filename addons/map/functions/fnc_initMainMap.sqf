#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineResincl.inc"

params ["_display"];
private _control = _display displayCtrl IDC_MAP;

GVAR(lastStillPosition) = _control ctrlMapScreenToWorld [0.5, 0.5];
GVAR(lastStillTime) = CBA_missionTime;
GVAR(isShaking) = false;

//map sizes are multiples of 1280
GVAR(worldSize) = worldSize / 1280;
GVAR(mousePos) = [0.5,0.5];

//Allow panning the lastStillPosition while mapShake is active
GVAR(rightMouseButtonLastPos) = [];
_control ctrlAddEventHandler ["Draw", {_this call FUNC(updateMapEffects)}];
_control ctrlAddEventHandler ["MouseMoving", {
    if (GVAR(isShaking) && {(count GVAR(rightMouseButtonLastPos)) == 2}) then {
        private _lastPos = (_this select 0) ctrlMapScreenToWorld GVAR(rightMouseButtonLastPos);
        private _newPos = (_this select 0) ctrlMapScreenToWorld (_this select [1,2]);
        GVAR(lastStillPosition) set [0, (GVAR(lastStillPosition) select 0) + (_lastPos select 0) - (_newPos select 0)];
        GVAR(lastStillPosition) set [1, (GVAR(lastStillPosition) select 1) + (_lastPos select 1) - (_newPos select 1)];
        GVAR(rightMouseButtonLastPos) = _this select [1,2];
        TRACE_3("Mouse Move",_lastPos,_newPos,GVAR(rightMouseButtonLastPos));
    };
}];
_control ctrlAddEventHandler ["MouseButtonDown", {
    if ((_this select 1) == 1) then {
        GVAR(rightMouseButtonLastPos) = _this select [2,2];
    };
}];
_control ctrlAddEventHandler ["MouseButtonUp", {
    if ((_this select 1) == 1) then {
        GVAR(rightMouseButtonLastPos) = [];
    };
}];

//get mouse position on map
_control ctrlAddEventHandler ["MouseMoving", {
    GVAR(mousePos) = (_this select 0) ctrlMapScreenToWorld [_this select 1, _this select 2];
}];
_control ctrlAddEventHandler ["MouseHolding", {
    GVAR(mousePos) = (_this select 0) ctrlMapScreenToWorld [_this select 1, _this select 2];
}];
