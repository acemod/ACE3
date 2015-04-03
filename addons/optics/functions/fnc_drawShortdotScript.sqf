// by commy2
#include "script_component.hpp"

private ["_control", "_zoom"];

_control = _this select 0;
_zoom = _this select 1;

private ["_sizeX", "_sizeY"];

_sizeX = _zoom/4;
_sizeY = _sizeX*safezoneW/safezoneH;

_control ctrlSetPosition [
    safezoneX+0.5*safezoneW-0.5*_sizeX,
    safezoneY+0.5*safezoneH-0.5*_sizeY,
    _sizeX,
    _sizeY
];
_control ctrlCommit 0;
