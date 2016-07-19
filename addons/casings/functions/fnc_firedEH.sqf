/*
 * Author: Rocko and esteldunedain
 * Create empty casing on weapon fired. Called from an ammo fired EH.
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

private _unitPosATL = getposATL _unit;

// Make far away units 10 times less likely to create casings
if ((positionCameraToWorld [0,0,0]) vectorDistance _unitPosATL > 100 && {random 1 < 0.9}) exitWith {};

private _cartridge = getText (configFile >> "CfgAmmo" >> _ammo >> "cartridge");
private _casingType = "ACE_casings_" + _cartridge;

private _ejectDir = (_unit weaponDirection currentWeapon _unit) vectorCrossProduct [0, 0, 1];
private _posATL = _unitPosATL vectorAdd
                  (_ejectDir vectorMultiply 1.2) vectorAdd
                  [random 1.0, random 1.0, 0];
_posATL set [2, (_unitPosATL select 2) + 0.01];

[{
    params ["_casingType", "_posATL"];
    private _casing = _casingType createVehicleLocal _posATL;
    _casing setposATL _posATL;
    _casing setdir (random 360);

    // Delete former casing (nothing happens if it's an objNull)
    deleteVehicle (GVAR(casings) select GVAR(currentIndex));
    // Store newly created casing
    GVAR(casings) set [GVAR(currentIndex), _casing];
    // Update storage index
    GVAR(currentIndex) = (GVAR(currentIndex) + 1) % GVAR(maxCasings);

    TRACE_3("", _casing, _posATL, GVAR(currentIndex));

}, [_casingType, _posATL], 0.4] call CBA_fnc_waitAndExecute;
