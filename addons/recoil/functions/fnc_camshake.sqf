// TMR: Small Arms - Recoil initialization and functions
// (C) 2013 Ryan Schultz. See LICENSE.
// Edited prefixes for compatability in AGM_Realism by KoffeinFlummi
// Edited by commy2
#include "script_component.hpp"

#define BASE_POWER 0.40
#define BASE_TIME 0.19
#define BASE_FREQ 13
#define RECOIL_COEF 40

private ["_unit", "_weapon", "_muzzle"];

_unit = _this select 0;
_weapon = _this select 1;
_muzzle = _this select 2;

if (toLower _weapon in ["throw", "put"]) exitWith {};

private ["_powerMod", "_timeMod", "_freqMod"];

_powerMod = ([0, -0.1, -0.1, 0, -0.2] select (["STAND", "CROUCH", "PRONE", "UNDEFINED", ""] find stance _unit)) + ([0, -1, 0, -1] select (["INTERNAL", "EXTERNAL", "GUNNER", "GROUP"] find cameraView));
_timeMod = 0;
_freqMod = 0;

// to get camshake read kickback
private ["_config", "_recoil"];

_config = configFile >> "CfgWeapons" >> _weapon;
_recoil = if (_muzzle == _weapon) then {
    getText (_config >> "recoil")
} else {
    getText (_config >> _muzzle >> "recoil")
};

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

private "_powerCoef";
_powerCoef = RECOIL_COEF * linearConversion [0, 1, random 1, _recoil select 0, _recoil select 1, false]; 

if (isWeaponRested _unit) then {_powerMod = _powerMod - 0.07};
if (isWeaponDeployed _unit) then {_powerMod = _powerMod - 0.11};

private "_camshake";
_camshake = [
    _powerCoef * (BASE_POWER + _powerMod) max 0,
    BASE_TIME + _timeMod max 0,
    BASE_FREQ + _freqMod max 0
];

/*
    systemChat str _camshake;
    copyToClipboard format ["addCamShake %1;", _camshake];
*/

addCamShake _camshake;
