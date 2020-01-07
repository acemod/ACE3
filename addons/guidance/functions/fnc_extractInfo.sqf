#include "script_component.hpp"
/*
 * Author: LorenLuke
 * Extracts projectile, seeker, and other information to hand off to onFired EH.
 *
 * Arguments (from EH):
 * 0: Shooter <OBJECT>
 * 1: Weapon <STRING>
 * 2: Muzzle <STRING>
 * 3: Mode <STRING>
 * 4: Ammo <class>
 * 5: Magazine <class>
 * 6: Projectile <OBJECT>
 *
 * Return Value:
 *  <ARRAY>
 *
 * Example:
 * _this call ace_missileguidance_fnc_extractInfo;
 *
 * Public: No
 */
params ["_shooter","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile"];

private _launchPos = getPosASL _projectile;
private _targetVector = [0,0,0];

private _target = _shooter getVariable [QGVAR(target), objNull];
private _targetPos = _shooter getVariable [QGVAR(targetPosition), [0,0,0]];
private _seekerType = _shooter getVariable [QGVAR(seekerType), nil];
private _attackProfile = _shooter getVariable [QGVAR(attackProfile), nil];
if ((getNumber (configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON) >> "useModeForAttackProfile")) == 1) then {
    _attackProfile = getText (configFile >> "CfgWeapons" >> _weapon >> _mode >> QGVAR(attackProfile))
};
private _lockMode = _shooter getVariable [QGVAR(lockMode), nil];

private _miscSeeker = [];
private _miscProfile = [];



private _config = configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON);

private _seekerType = _shooter getVariable [QGVAR(seekerType), nil];
if (isNil "_seekerType" || {!(_seekerType in (getArray (_config >> "seekerTypes")))}) then {
    _seekerType = getText (_config >> "defaultSeekerType");
};
private _attackProfile = _shooter getVariable [QGVAR(attackProfile), nil];
if (isNil "_attackProfile" || {!(_attackProfile in (getArray (_config >> "attackProfiles")))}) then {
    _attackProfile = getText (_config >> "defaultAttackProfile");
};
if ((getNumber (configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON) >> "useModeForAttackProfile")) == 1) then {
    _attackProfile = getText (configFile >> "CfgWeapons" >> _weapon >> _mode >> QGVAR(attackProfile))
};


//get misc for seeker
private _seekerFunction = getText (configFile >> QGVAR(SeekerTypes) >> _seekerType >> "functionName");
_miscSeeker set [0, true];
switch (_seekerType) do {
    case "GPS": {
        private _gpsTargetPos = _shooter getVariable [QGVAR(GPSPos), [0,0,0]];
        _targetPos = _gpsTargetPos;
        _target = objNull;
        _miscSeeker set [0, true];
        _miscSeeker set [1, true];
        _miscSeeker set [2, _gpsTargetPos];
    };
    case "EO": {};
    case "SALH": {
        private _laserCode = _shooter getVariable [QEGVAR(laser,code), ACE_DEFAULT_LASER_CODE];
        private _laserInfo = [_laserCode, ACE_DEFAULT_LASER_WAVELENGTH, ACE_DEFAULT_LASER_WAVELENGTH];

        _miscSeeker set [1, _laserInfo];
    };
    case "SACLOS": {};
    case "MCLOS": {};
    case "PLOS": {};
    case "IR": {};
    case "ARH": {};
    case "PRH": {};
    default {
        _miscSeeker set [0, false];
    };
};

//get misc for profile
private _attackProfileFunction = getText (configFile >> QGVAR(AttackProfiles) >> _attackProfile >> "functionName");

switch (_attackProfile) do {
    case "FGM": {
        
    };
    case "FIM": {};
    case "ATGM": {};
    case "SSBM": {
        _miscProfile set [0, getNumber (configFile >> "CfgAmmo" >> _ammo >> "thrust")];
        _miscProfile set [1, getNumber (configFile >> "CfgAmmo" >> _ammo >> "thrustTime")];
        _miscProfile set [2, time];
    
    };
    case "SAM": {};
    case "AGM": {};
    case "AAM": {};
    case "GBU": {};
    case "ROCKET": {};
    case "INDIRECT": {
        _miscSeeker set [0, false];
    };
    case "DIRECT": {};
    default {};
};


/*
if (_shooter isKindOf "Plane" && { !hasPilotCamera _shooter }) exitWith { WARNING("SACLOS fired from planes without camera unsupported"); };

private _turretPath = [_shooter, _weapon] call CBA_fnc_turretPathWeapon;
private _turretConfig = [_shooter, _turretPath] call CBA_fnc_getTurret;
private _memoryPointGunnerOptics = getText(_turretConfig >> "memoryPointGunnerOptics");
private _animationSourceBody = getText(_turretConfig >> "animationSourceBody");
private _animationSourceGun = getText(_turretConfig >> "animationSourceGun");
_seekerStateParams set [0, _memoryPointGunnerOptics];
_seekerStateParams set [1, _animationSourceBody];
_seekerStateParams set [2, _animationSourceGun];
*/

if(_shooter == vehicle player) then {
    if(vehicle player == player) then {
    
    } else {
    //if pilot-camera target
        if (getPilotCameraTarget _shooter select 0) then {
            _targetPos = getPilotCameraTarget _shooter select 1;
            _targetVector = (ATLtoASL (_shooter modeltoWorld (getPilotCameraPosition _shooter))) vectorFromTo _targetPos;
            if(getPilotCameraTarget _shooter select 2 != objNull) then {
                _target = getPilotCameraTarget _shooter select 2;
            };
    //if game-locked target
        } else {
            if (!(isNull cursorTarget)) then {
                _target = cursorTarget;
                _targetPos = ATLtoASL (cursorTarget modeltoWorld [0,0,0]);
                _targetVector = _launchPos vectorFromTo _targetPos;
            } else {_targetVector = _launchPos vectorFromTo _targetPos};
        };
    };
};

if(!(_targetPos isEqualTo [0,0,0])) then {
    _projectile setMissileTargetPos _targetPos;
};
if(!(isNull _target)) then {
    _projectile setMissileTarget _target;
};

//hint format ["%1",[_seekerType, _attackProfile, _target,_targetPos,_targetVector, _launchPos, _miscSeeker, _miscProfile]];

[_seekerType, _attackProfile, _target,_targetPos,_targetVector, _launchPos, _miscSeeker, _miscProfile];
