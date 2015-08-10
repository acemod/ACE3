/*
 * Author: KoffeinFlummi, Ruthberg
 * Applies the adjustment for the current scope
 *
 * Argument:
 * 0: Unit <OBJECT>
 * 1: Absolute elevation <NUMBER>
 * 2: Absolute windage <NUMBER>
 * 3: Absolute zero reference <NUMBER>
 *
 * Return value:
 * True <BOOL>
 *
 * Example:
 * [player, 1.3, 0.3, 0.1] call ace_scopes_fnc_applyScopeAdjustment
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_adjustmentDifference", "_pitchBankYaw", "_adjustment", "_weaponIndex"];

params ["_unit", "_elevation", "_windage", "_zero"];

_weaponIndex = [_unit, currentWeapon _unit] call EFUNC(common,getWeaponIndex);

_adjustment = _unit getVariable QGVAR(Adjustment);
if (isNil "_adjustment") then {
    // [Windage, Elevation, Zero]
    _adjustment = [[0, 0, 0], [0, 0, 0], [0, 0, 0]];
    _unit setVariable [QGVAR(Adjustment), _adjustment];
};

_adjustmentDifference = (_adjustment select _weaponIndex) vectorDiff [_elevation, _windage, _zero];

_adjustment set [_weaponIndex, [_elevation, _windage, _zero]];
[_unit, QGVAR(Adjustment), _adjustment, 0.5] call EFUNC(common,setVariablePublic);

playSound (["ACE_Scopes_Click_1", "ACE_Scopes_Click_2", "ACE_Scopes_Click_3"] select floor random 3);

// slightly rotate the player if looking through optic
if (cameraView == "GUNNER") then {
    // Convert adjustmentDifference from mils to degrees
    _adjustmentDifference = [_adjustmentDifference, {_this * 0.05625}] call EFUNC(common,map);
    _adjustmentDifference params ["_elevationDifference", "_windageDifference"];
    _pitchBankYaw = [_unit] call EFUNC(common,getPitchBankYaw);
    _pitchBankYaw params ["_pitch", "_bank", "_yaw"];
    _pitch = _pitch + _elevationDifference;
    _yaw = _yaw + _windageDifference;
    [_unit, _pitch, _bank, _yaw] call EFUNC(common,setPitchBankYaw);
} else {
    [] call FUNC(showZeroing);
};

true
