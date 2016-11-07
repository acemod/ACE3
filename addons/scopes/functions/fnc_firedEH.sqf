/*
 * Author: KoffeinFlummi, esteldunedain
 * Adjusts the flight path of the bullet according to the zeroing. Called from the unified fired EH only for local and non-local players on foot.
 *
 * Arguments:
 * None. Parameters inherited from EFUNC(common,firedEH)
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

//IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle", "_gunner", "_turret"];
TRACE_10("firedEH:",_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile, _vehicle, _gunner, _turret);

private _adjustment = _unit getVariable [QGVAR(Adjustment), []];
if (_adjustment isEqualTo []) exitWith {};

private _weaponIndex = [_unit, currentWeapon _unit] call EFUNC(common,getWeaponIndex);
if (_weaponIndex < 0) exitWith {};

private _zeroing = +(_adjustment select _weaponIndex);
TRACE_1("Adjusting With",_zeroing);

// Convert zeroing from mils to degrees
_zeroing = _zeroing vectorMultiply 0.05625;

if (_ammo isKindOf "BulletBase") then {
    private _railHeightAboveBore = 0;
    private _scopeHeightAboveRail = 0;
    // Determine rail height above bore
    private _weaponConfig = configFile >> "CfgWeapons" >> _weapon;
    if (isNumber (_weaponConfig >> "ACE_RailHeightAboveBore")) then {
        _railHeightAboveBore = getNumber(_weaponConfig >> "ACE_RailHeightAboveBore");
    } else {
        switch (_weaponIndex) do {
            case 0: { _railHeightAboveBore = 2.0; }; // Rifle
            case 2: { _railHeightAboveBore = 0.7; }; // Pistol
        };
    };
    // Determine scope height above rail
    private _optic = GVAR(Optics) select _weaponIndex;
    private _opticConfig = configFile >> "CfgWeapons" >> _optic;
    if (isNumber (_opticConfig >> "ACE_ScopeHeightAboveRail")) then {
        _scopeHeightAboveRail = getNumber(_opticConfig >> "ACE_ScopeHeightAboveRail");
    } else {
        switch (getNumber(_opticConfig >> "ItemInfo" >> "opticType")) do {
            case 1: { _scopeHeightAboveRail = 3.0; }; // RCO or similar
            case 2: { _scopeHeightAboveRail = 4.0; }; // High power scope
            default {
                switch (_weaponIndex) do {
                    case 0: { _scopeHeightAboveRail = 0.5; }; // Rifle iron sights
                    case 2: { _scopeHeightAboveRail = 0.3; }; // Pistol iron sights
                };
            };
        };
    };
    private _advancedBallistics = missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false];
    private _boreHeight = _railHeightAboveBore + _scopeHeightAboveRail;
    private _oldZeroRange = currentZeroing _unit;
    private _newZeroRange = _oldZeroRange; // Change this if you want to overwrite the discreteDistance[] setting
    private _zeroCorrection = missionNamespace getVariable format[QGVAR(%1_%2_%3_%4_%5_%6_%7), _oldZeroRange, _newZeroRange, _boreHeight, _weapon, _ammo, _magazine, _advancedBallistics];
    if (isNil "_zeroCorrection") then {
         _zeroCorrection = [_oldZeroRange, _newZeroRange, _boreHeight, _weapon, _ammo, _magazine, _advancedBallistics] call FUNC(calculateZeroAngleCorrection);
    };
    _zeroing = _zeroing vectorAdd [0, 0, _zeroCorrection];
};

if (_zeroing isEqualTo [0, 0, 0]) exitWith {};

_zeroing params ["_elevation", "_windage", "_zero"];

[_projectile, _windage, _elevation + _zero, 0] call EFUNC(common,changeProjectileDirection);
