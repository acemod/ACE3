/*
 * Author: KoffeinFlummi, esteldunedain
 * Adjusts the flight path of the bullet according to the zeroing. Called from the unified fired EH only for local and non-local players on foot.
 *
 * Argument:
 * None. Parameters inherited from EFUNC(common,firedEH)
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

//IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle", "_gunner", "_turret"];
TRACE_10("firedEH:",_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile, _vehicle, _gunner, _turret);

// Quit if the scope doesn't support adjusting
private _weaponIndex = [_unit, currentWeapon _unit] call EFUNC(common,getWeaponIndex);
if (_weaponIndex < 0) exitWith {};
((_unit getVariable [QGVAR(SupportsAdjustment), [[false, false], [false, false], [false, false]]]) select _weaponIndex) params ["_adjustHorizontal", "_adjustVertical"];
if !(_adjustHorizontal || _adjustVertical) exitWith {};

// Get current scope adjustment
private _adjustment = _unit getVariable [QGVAR(Adjustment), []];
if (_adjustment isEqualTo []) then {
    _adjustment = [0,0,0];
} else {
    _adjustment = _adjustment select _weaponIndex;
}
// Convert it from mils to degrees
private _zeroing = _adjustment vectorMultiply 0.05625;
_zeroing params ["_elevation", "_windage", "_zero"];
_elevation = _elevation + _zero;

// The scope supports vertical adjustment, so even if _zeroing is [0,0,0] we
// still need to compute the correction to compensate for vanilla zeroing
if (_adjustVertical) then {
    // Calculate the correction due to vanilla zeroing
    private _zeroDistance = (currentZeroing _unit - GVAR(defaultZeroDistance));
    if (_zeroDistance == 0) then {
        private _weaponCombo = [_weapon, _magazine, _ammo, _zeroDistance];
        if !(_weaponCombo isEqualTo (_unit getVariable [QGVAR(lastWeaponCombo), []])) then {
            // Hackish way of getting initSpeed. @todo: replace it by correct calculation and caching
            private _initSpeed = vectorMagnitude velocity _projectile;

            private _airFriction = getNumber (configFile >> "CfgAmmo" >> _ammo >> "airFriction");
            private _antiOffset = "ace_fcs" callExtension format ["%1,%2,%3,%4", _initSpeed, _airFriction, 0, _zeroDistance];
            _antiOffset = parseNumber _antiOffset;

            _unit setVariable [QGVAR(lastWeaponCombo), _weaponCombo];
            _unit setVariable [QGVAR(lastAntiOffset), _antiOffset];
        };
        private _antiOffset = _unit getVariable QGVAR(lastAntiOffset);

        _elevation = _elevation - _antiOffset;
        TRACE_4("fired",_unit, currentZeroing _unit, _antiOffset, _offset);
    };
};

// Make a final check to see if all the adjustments compensated after all
if (_windage == 0 && {_elevation == 0}) exitWith {};
[_projectile, _windage, _elevation, 0] call EFUNC(common,changeProjectileDirection);
