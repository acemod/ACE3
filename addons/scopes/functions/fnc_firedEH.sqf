#include "..\script_component.hpp"
/*
 * Author: KoffeinFlummi, esteldunedain, Ruthberg
 * Adjusts the flight path of the bullet according to the zeroing. Called from the unified fired EH only for local and non-local players on foot.
 *
 * Arguments:
 * None. Parameters inherited from EFUNC(common,firedEH)
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_scopes_fnc_firedEH
 *
 * Public: No
 */

//IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle", "_gunner", "_turret"];
TRACE_10("firedEH:",_unit,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile,_vehicle,_gunner,_turret);

if !(_ammo isKindOf "BulletBase") exitWith {};

private _weaponIndex = [_unit, currentWeapon _unit] call EFUNC(common,getWeaponIndex);
if (_weaponIndex < 0) exitWith {};

private _adjustment = _unit getVariable [QGVAR(Adjustment), [[0, 0, 0], [0, 0, 0], [0, 0, 0]]];
private _zeroing = (_adjustment select _weaponIndex) vectorMultiply 0.05729578; // Convert zeroing from mils to degrees (value of MRAD_TO_DEG(1))
TRACE_1("Adjusting With",_zeroing);

if (GVAR(correctZeroing) || GVAR(simplifiedZeroing)) then {
    private _advancedBallistics = missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false];
    private _baseAngle = (_unit getVariable [QGVAR(baseAngle), [0,0,0]]) select _weaponIndex;
    private _boreHeight = (_unit getVariable [QGVAR(boreHeight), [0,0,0]]) select _weaponIndex;
    private _oldZeroRange = currentZeroing _unit;
    private _newZeroRange = [_unit] call FUNC(getCurrentZeroRange);
    private _zeroCorrection = [_oldZeroRange, _newZeroRange, _boreHeight, _weapon, _muzzle, _ammo, _magazine, _advancedBallistics] call FUNC(calculateZeroAngleCorrection);

    _zeroing = if (GVAR(simplifiedZeroing)) then {
        [0, 0, _zeroCorrection - _baseAngle]
    } else {
        _zeroing vectorAdd [0, 0, _zeroCorrection - _baseAngle]
    };
#ifdef DISABLE_DISPERSION
    _projectile setVelocity (_unit weaponDirection currentWeapon _unit) vectorMultiply (vectorMagnitude (velocity _projectile));
#endif
};

TRACE_1("",_zeroing);
if (_zeroing isEqualTo [0, 0, 0]) exitWith {};

_zeroing params ["_elevation", "_windage", "_zero"];

[_projectile, _windage, _elevation + _zero, 0] call EFUNC(common,changeProjectileDirection);
