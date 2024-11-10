#include "..\script_component.hpp"
/*
 * Author: Original by Ryan Schultz, edited by KoffeinFlummi, commy2
 * Adds camera shake when firing. Called from the unified fired EH only for the local player.
 * From TMR: Small Arms
 *
 * Arguments:
 * Parameters inherited from EFUNC(common,firedEH)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, currentWeapon player, currentMuzzle player] call ace_recoil_fnc_camshake
 *
 * Public: No
 */

//IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle", "_gunner", "_turret"];
TRACE_10("firedEH:",_unit,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile,_vehicle,_gunner,_turret);

#define BASE_POWER 0.40
#define BASE_TIME 0.19
#define BASE_FREQ 13
#define RECOIL_COEF 40

if (toLowerANSI _weapon in ["throw", "put"]) exitWith {};

private _powerMod = ([0, -0.1, -0.1, 0, -0.2] select (["STAND", "CROUCH", "PRONE", "UNDEFINED", ""] find stance _unit)) + ([0, -1, 0, -1] select (["INTERNAL", "EXTERNAL", "GUNNER", "GROUP"] find cameraView));

// Get camshake read kickback
private _recoil = GVAR(recoilCache) getOrDefaultCall [_weapon + _muzzle, {
    private _config = configFile >> "CfgWeapons" >> _weapon;

    private _recoil = if (_muzzle == _weapon) then {
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

    TRACE_3("Caching Recoil config",_weapon,_muzzle,_recoil);

    // Ensure format is correct
    _recoil resize [2, 0];

    // Parse numbers
    _recoil apply { if (_x isEqualType 0) then { _x } else { call compile format ["%1", _x] } } // return
}, true];

private _powerCoef = RECOIL_COEF * linearConversion [0, 1, random 1, _recoil select 0, _recoil select 1, false];

if (isWeaponRested _unit) then {_powerMod = _powerMod - 0.07};
if (isWeaponDeployed _unit) then {_powerMod = _powerMod - 0.11};
if (_weapon isEqualTo secondaryWeapon _unit) then {
    _powerCoef = _powerCoef + 25.0;
};

private _camshake = [
    _powerCoef * (BASE_POWER + _powerMod) max 0,
    BASE_TIME,
    BASE_FREQ
];

TRACE_4("addCamShake",_recoil,_powerCoef,_powerMod,_camshake);

addCamShake _camshake;
