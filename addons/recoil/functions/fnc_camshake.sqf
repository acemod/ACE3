// TMR: Small Arms - Recoil initialization and functions
// (C) 2013 Ryan Schultz. See LICENSE.
// Edited prefixes for compatability in AGM_Realism by KoffeinFlummi
// Edited by commy2
#include "script_component.hpp"

#define BASE_POWER 0.40
#define BASE_TIME 0.19
#define BASE_FREQ 13
#define RECOIL_COEF 40

params ["_unit", "_weapon", "_muzzle"];

if (toLower _weapon in ["throw", "put"]) exitWith {};

private _powerMod = ([0, -0.1, -0.1, 0, -0.2] select (["STAND", "CROUCH", "PRONE", "UNDEFINED", ""] find stance _unit)) + ([0, -1, 0, -1] select (["INTERNAL", "EXTERNAL", "GUNNER", "GROUP"] find cameraView));
private _timeMod = 0;
private _freqMod = 0;

// to get camshake read kickback
private _config = configFile >> "CfgWeapons" >> _weapon;

if (_muzzle != _weapon) then {
    _config = _config >> _muzzle;
};

private _recoil = getText (_config >> "recoil");

if (isClass (configFile >> "CfgRecoils" >> _recoil)) then {
    _recoil = getArray (configFile >> "CfgRecoils" >> _recoil >> "kickBack");
    if (count _recoil < 2) then {
        _recoil = [0, 0];
    };
} else {
    _recoil = [0, 0];
};

// parse numbers
_recoil set [0, call compile format ["%1", _recoil select 0]]; 
_recoil set [1, call compile format ["%1", _recoil select 1]];

private _powerCoef = RECOIL_COEF * linearConversion [0, 1, random 1, _recoil select 0, _recoil select 1, false]; 

if (isWeaponRested _unit) then {_powerMod = _powerMod - 0.07};
if (isWeaponDeployed _unit) then {_powerMod = _powerMod - 0.11};

private _camshake = [
    _powerCoef * (BASE_POWER + _powerMod) max 0,
    BASE_TIME + _timeMod max 0,
    BASE_FREQ + _freqMod max 0
];

/*
    systemChat str _camshake;
    copyToClipboard format ["addCamShake %1;", _camshake];
*/

addCamShake _camshake;
