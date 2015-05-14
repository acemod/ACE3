// by commy2
#include "script_component.hpp"

disableSerialization;

private ["_display", "_control"];

_display = _this select 0;

_control = _display displayCtrl 1713154;

if (!ctrlShown (_display displayCtrl 154)) exitWith {
    _control ctrlShow false;
};

private ["_sizeX", "_sizeY"];

_sizeX = (call EFUNC(common,getZoom))/4;
_sizeY = _sizeX*safezoneW/safezoneH;

_control ctrlSetPosition [
    safezoneX+0.5*safezoneW-0.5*_sizeX,
    safezoneY+0.5*safezoneH-0.5*_sizeY,
    _sizeX,
    _sizeY
];

_control ctrlCommit 0;
_control ctrlShow true;
