// by commy2
#include "script_component.hpp"





if (GVAR(showShortdot)) then {




private "_control";
_control = uiNamespace getVariable ["ACE_ctrlShortdotReticle", controlNull];

if (cameraView != "GUNNER" || {currentWeapon ACE_player != primaryWeapon ACE_player}) exitWith {
    _control ctrlShow false;
};

private ["_size", "_sizeX", "_sizeY"];

_size = call EFUNC(common,getZoom);

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
