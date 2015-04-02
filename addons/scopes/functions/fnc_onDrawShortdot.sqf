// by commy2
#include "script_component.hpp"

private ["_control", "_scope"];

_control = _this select 0 select 0;
_scope = _this select 0 select 1;

if (currentWeapon ACE_player != primaryWeapon ACE_player || {_scope != primaryWeaponItems ACE_player select 2}) exitWith {
    _control ctrlShow false;

    GVAR(shownShortdot) = false;
    [_this select 1] call CBA_fnc_removePerFrameHandler;
};

if (cameraView != "GUNNER") exitWith {
    _control ctrlShow false;
};

private ["_size", "_sizeX", "_sizeY"];

_size = ([0.5,0.5] distance worldToScreen positionCameraToWorld [0,1,1]) * (getResolution select 5);

_sizeX = _size/4;
_sizeY = _sizeX*safezoneW/safezoneH;

_control ctrlSetPosition [
    safezoneX+0.5*safezoneW-0.5*_sizeX,
    safezoneY+0.5*safezoneH-0.5*_sizeY,
    _sizeX,
    _sizeY
];
_control ctrlCommit 0;
_control ctrlShow true;
