#include "script_component.hpp"
/*
 * Author: KoffeinFlummi, Ruthberg
 * Applies the adjustment for the current scope
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Absolute elevation <NUMBER>
 * 2: Absolute windage <NUMBER>
 * 3: Absolute zero reference <NUMBER>
 *
 * Return Value:
 * True <BOOL>
 *
 * Example:
 * [player, 1.3, 0.3, 0.1] call ace_scopes_fnc_applyScopeAdjustment
 *
 * Public: No
 */

params ["_unit", "_elevation", "_windage", "_zero"];

private _weaponIndex = [_unit, currentWeapon _unit] call EFUNC(common,getWeaponIndex);

private _adjustment = _unit getVariable [QGVAR(Adjustment), [[0, 0, 0], [0, 0, 0], [0, 0, 0]]];
private _adjustmentDifference = (_adjustment select _weaponIndex) vectorDiff [_elevation, _windage, _zero];
if (_adjustmentDifference isEqualTo [0,0,0]) exitWith {false};  // Don't coninue if no adjustment is made

_adjustment set [_weaponIndex, [_elevation, _windage, _zero]];
[_unit, QGVAR(Adjustment), _adjustment, 0.5] call EFUNC(common,setVariablePublic);

playSound selectRandom ["ACE_Scopes_Click_1", "ACE_Scopes_Click_2", "ACE_Scopes_Click_3"];

// slightly rotate the player if looking through optic
if (cameraView == "GUNNER") then {
    if (!GVAR(simplifiedZeroing)) then {
        // Convert adjustmentDifference from mils to degrees
        _adjustmentDifference = _adjustmentDifference apply {MRAD_TO_DEG(_x)};
        _adjustmentDifference params ["_elevationDifference", "_windageDifference"];
        private _pitchBankYaw = [_unit] call EFUNC(common,getPitchBankYaw);
        _pitchBankYaw params ["_pitch", "_bank", "_yaw"];
        _pitch = _pitch + _elevationDifference;
        _yaw = _yaw + _windageDifference;
        [_unit, _pitch, _bank, _yaw] call EFUNC(common,setPitchBankYaw);
    };
} else {
    [] call FUNC(showZeroing);
};

true
