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
 * Public: No
 */
#include "script_component.hpp"

EXPLODE_4_PVT(_this,_unit,_elevation,_windage,_zero);

private ["_adjustmentDifference", "_pitchbankyaw", "_pitch", "_bank", "_yaw", "_adjustment", "_weaponIndex"];

_weaponIndex = [_unit, currentWeapon _unit] call EFUNC(common,getWeaponIndex);

_adjustment = _unit getVariable QGVAR(Adjustment);
if (isNil "_adjustment") then {
    // [Windage, Elevation, Zero]
    _adjustment = [[0,0,0], [0,0,0], [0,0,0]];
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
    _pitchbankyaw = [_unit] call EFUNC(common,getPitchBankYaw);
    _pitch = (_pitchbankyaw select 0) + (_adjustmentDifference select 0);
    _bank  = (_pitchbankyaw select 1);
    _yaw   = (_pitchbankyaw select 2) + (_adjustmentDifference select 1);
    [_unit, _pitch, _bank, _yaw] call EFUNC(common,setPitchBankYaw);
} else {
    [] call FUNC(showZeroing);
};

true
