/*
 * Author: KoffeinFlummi
 * Changes the adjustment for the current scope
 *
 * Argument:
 * 0: Unit <OBJECT>
 * 1: Horizontal adjustment <NUMBER>
 * 2: Vertical adjustment <NUMBER>
 *
 * Return value:
 * True <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_unit", "_weapons", "_zeroing", "_pitchbankyaw", "_pitch", "_bank", "_yaw", "_hint"];

_unit = _this select 0;

_weaponIndex = [_unit, currentWeapon _unit] call EFUNC(common,getWeaponIndex);

_adjustment = _unit getVariable QGVAR(Adjustment);
if (isNil "_adjustment") then {
    _adjustment = [[0,0], [0,0], [0,0]];
    _unit setVariable [QGVAR(Adjustment), _adjustment];
};

_zeroing = _adjustment select _weaponIndex;
_zeroing set [0, (round (((_zeroing select 0) + (_this select 1)) * 10)) / 10];
_zeroing set [1, (round (((_zeroing select 1) + (_this select 2)) * 10)) / 10];

// Change the adjustment array
_adjustment set [_weaponIndex, _zeroing];
[_unit, QGVAR(Adjustment), _adjustment, 0.5] call EFUNC(common,setVariablePublic);

playSound (["ACE_Scopes_Click_1", "ACE_Scopes_Click_2", "ACE_Scopes_Click_3"] select floor random 3);

// slightly rotate the player if looking through optic
if (cameraView == "GUNNER") then {

    _pitchbankyaw = [_unit] call EFUNC(common,getPitchBankYaw);
    // these are not exact mil-to-degree conversions, but instead chosen
    // to minimize the effect of rounding errors
    _pitch = (_pitchbankyaw select 0) + ((_this select 2) * -0.04);
    _bank = _pitchbankyaw select 1;
    _yaw = (_pitchbankyaw select 2) + ((_this select 1) * -0.04);
    [_unit, _pitch, _bank, _yaw] call EFUNC(common,setPitchBankYaw)

} else {

    [] call FUNC(showZeroing);

};

true
