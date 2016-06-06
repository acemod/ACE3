/*
 * Author: commy2
 * Animate scripted reticle of spotting scope.
 *
 * Arguments:
 * 0: Reticles RSC info display <DISPLAY>
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;

params ["_display"]; systemChat str _display;

// check if optics are used
// hide all controls otherwise
private _isUsingOptic = ctrlShown (_display displayCtrl 154);

(_display displayCtrl IDC_BLACK_LEFT) ctrlShow _isUsingOptic;
(_display displayCtrl IDC_BLACK_RIGHT) ctrlShow _isUsingOptic;

// animate reticle
private _ctrlReticle = _display displayCtrl IDC_RETICLE;
private _ctrlBody = _display displayCtrl IDC_BODY;

_ctrlReticle ctrlShow _isUsingOptic;
_ctrlBody ctrlShow _isUsingOptic;



/*

private _unit = call CBA_fnc_currentUnit;

if (currentWeapon _unit != primaryWeapon _unit || {_scope != primaryWeaponItems _unit select 2}) exitWith {
    _control ctrlShow false;

    [_this select 1] call CBA_fnc_removePerFrameHandler
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


