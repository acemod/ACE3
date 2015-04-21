/*
 * Original Author: Taosenai
 * Adapted By: KoffeinFlummi, commy2
 *
 * Animates the scope when firing.
 *
 * Arguments:
 * 0: Unit (Object)
 * 1: Weapon (String)
 * 2: Muzzle (String)
 * 3: Mode (String)
 * 4: Ammo (Object)
 * 5: Magazine (String)
 * 6: Projectile (Object)
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"

private ["_unit", "_weapon"];

_unit = _this select 0;
_weapon = _this select 1;

// check if compatible scope is used
private "_display";
_display = uiNamespace getVariable [QGVAR(RscWeaponInfo2D), displayNull];

if (isNull _display) exitWith {};

// Reduce the reticle movement as the player drops into lower, supported stances.
private "_recoilCoef";
_recoilCoef = switch (true) do {
    case (isWeaponDeployed _unit): {0.1};
    case (isWeaponRested _unit): {0.4};
    default {1};
};

// Constants which determine how the scope recoils
private ["_recoilScope", "_reticleShiftX", "_reticleShiftY", "_scopeShiftX", "_scopeShiftY"];

_recoilScope = _recoilCoef * linearConversion [0, 1, random 1, SCOPE_RECOIL_MIN, SCOPE_RECOIL_MAX, false];

_reticleShiftX = _recoilCoef * linearConversion [0, 1, random 1, RETICLE_SHIFT_X_MIN, RETICLE_SHIFT_X_MAX, false];
_reticleShiftY = _recoilCoef * linearConversion [0, 1, random 1, RETICLE_SHIFT_Y_MIN, RETICLE_SHIFT_Y_MAX, false];

_scopeShiftX = _recoilCoef * linearConversion [0, 1, random 1, SCOPE_SHIFT_X_MIN, SCOPE_SHIFT_X_MAX, false];
_scopeShiftY = _recoilCoef * linearConversion [0, 1, random 1, SCOPE_SHIFT_Y_MIN, SCOPE_SHIFT_Y_MAX, false];

// Create and commit recoil effect
private ["_sizeX", "_sizeY"];

_sizeX = (0.75+_recoilScope)/(getResolution select 5);
_sizeY = _sizeX*safezoneW/safezoneH*(16/9)/(getResolution select 4);

private "_positionReticle";
_positionReticle = [
    safezoneX+0.5*safezoneW-0.5*(_sizeX+_reticleShiftX),
    safezoneY+0.5*safezoneH-0.5*(_sizeY+_reticleShiftY),
    _sizeX,
    _sizeY
];

(_display displayCtrl 1713001) ctrlSetPosition _positionReticle;
(_display displayCtrl 1713002) ctrlSetPosition _positionReticle;

private "_positionBody";
_positionBody = [
    safezoneX+0.5*safezoneW-0.5*(2*_sizeX+_scopeShiftX),
    safezoneY+0.5*safezoneH-0.5*(2*_sizeY+_scopeShiftY),
    2*_sizeX,
    2*_sizeY
];

(_display displayCtrl 1713005) ctrlSetPosition _positionBody;
(_display displayCtrl 1713006) ctrlSetPosition _positionBody;

(_display displayCtrl 1713001) ctrlCommit 0;
(_display displayCtrl 1713002) ctrlCommit 0;
(_display displayCtrl 1713005) ctrlCommit 0;
(_display displayCtrl 1713006) ctrlCommit 0;

// Bring them all back
_sizeX = 0.75/(getResolution select 5);
_sizeY = _sizeX*safezoneW/safezoneH*(16/9)/(getResolution select 4);

_positionReticle = [
    safezoneX+0.5*safezoneW-0.5*_sizeX,
    safezoneY+0.5*safezoneH-0.5*_sizeY,
    _sizeX,
    _sizeY
];

(_display displayCtrl 1713001) ctrlSetPosition _positionReticle;
(_display displayCtrl 1713002) ctrlSetPosition _positionReticle;

_positionBody = [
    safezoneX+0.5*safezoneW-0.5*2*_sizeX,
    safezoneY+0.5*safezoneH-0.5*2*_sizeY,
    2*_sizeX,
    2*_sizeY
];

(_display displayCtrl 1713005) ctrlSetPosition _positionBody;
(_display displayCtrl 1713006) ctrlSetPosition _positionBody;

(_display displayCtrl 1713001) ctrlCommit RECENTER_TIME;
(_display displayCtrl 1713002) ctrlCommit RECENTER_TIME;
(_display displayCtrl 1713005) ctrlCommit RECENTER_TIME;
(_display displayCtrl 1713006) ctrlCommit RECENTER_TIME;
