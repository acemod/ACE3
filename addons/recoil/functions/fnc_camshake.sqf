#include "script_component.hpp"
/*
 * Author: Orginal by Ryan Schultz, edited by KoffeinFlummi, commy2
 * Adds camera shake when firing. Called from the unified fired EH only for the local player.
 * From TMR: Small Arms
 *
 * Arguments:
 * None. Parameters inherited from EFUNC(common,firedEH)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, (currentWeapon player), (currentMuzzle player)] call ace_recoil_fnc_camShake;
 *
 * Public: No
 */

//IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle", "_gunner", "_turret"];
TRACE_10("firedEH:",_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile, _vehicle, _gunner, _turret);

#define BASE_POWER 0.40
#define BASE_TIME 0.19
#define BASE_FREQ 13
#define RECOIL_COEF 40

if (toLower _weapon in ["throw", "put"]) exitWith {};

private _powerMod = ([0, -0.1, -0.1, 0, -0.2] select (["STAND", "CROUCH", "PRONE", "UNDEFINED", ""] find stance _unit)) + ([0, -1, 0, -1] select (["INTERNAL", "EXTERNAL", "GUNNER", "GROUP"] find cameraView));

// to get camshake read kickback
private _recoil = missionNamespace getVariable format [QGVAR(%1-%2), _weapon, _muzzle];

if (isNil "_recoil") then {
    private _config = configFile >> "CfgWeapons" >> _weapon;

    if (_muzzle == _weapon) then {
        _recoil = getText (_config >> "recoil")
    } else {
        _recoil = getText (_config >> _muzzle >> "recoil")
    };

    if (isClass (configFile >> "CfgRecoils" >> _recoil)) then {
        _recoil = getArray (configFile >> "CfgRecoils" >> _recoil >> "kickBack");
        if (count _recoil < 2) then {
            _recoil = [0, 0];
        };
    } else {
        _recoil = [0, 0];
    };

    TRACE_3("Caching Recoil config",_weapon,_muzzle,_recoil);

    // parse numbers
    _recoil set [0, call compile format ["%1", _recoil select 0]];
    _recoil set [1, call compile format ["%1", _recoil select 1]];

    missionNamespace setVariable [format [QGVAR(%1-%2), _weapon, _muzzle], _recoil];
};

private _powerCoef = RECOIL_COEF * linearConversion [0, 1, random 1, _recoil select 0, _recoil select 1, false];

if (isWeaponRested _unit) then {_powerMod = _powerMod - 0.07};
if (isWeaponDeployed _unit) then {_powerMod = _powerMod - 0.11};

private _camshake = [
    _powerCoef * (BASE_POWER + _powerMod) max 0,
    BASE_TIME,
    BASE_FREQ
];

TRACE_4("addCamShake",_recoil,_powerCoef,_powerMod,_camshake);

addCamShake _camshake;
