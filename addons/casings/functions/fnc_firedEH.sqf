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

BEGIN_COUNTER(fnc_fireEH);

private _unitPosATL = getposATL _unit;

// Make far away units 10 times less likely to create casings
if ((positionCameraToWorld [0,0,0]) vectorDistance _unitPosATL > 100 && {random 1 < 0.9}) exitWith {};

private _cartridge = getText (configFile >> "CfgAmmo" >> _ammo >> "cartridge");
private _casingType = "ACE_casings_" + _cartridge;

private _weapDir = _unit weaponDirection currentWeapon _unit;
private _ejectDir = _weapDir vectorCrossProduct [0, 0, 1];
private _posATL = _unitPosATL vectorAdd
                  (_weapDir vectorMultiply (-0.5 + random 1.0 + random 1.0)) vectorAdd
                  (_ejectDir vectorMultiply (0.2 + random 1.0 + random 1.0));

_posATL set [2, (_unitPosATL select 2) + 0.01];

[{
    BEGIN_COUNTER(fnc_fireEH_create);

    params ["_casingType", "_posATL"];

    // Check if we can reuse the existing casing
    private _casing = GVAR(casings) select GVAR(currentIndex);
    if (typeOf _casing != _casingType) then {
        // Delete former casing (nothing happens if it's an objNull)
        deleteVehicle _casing;
        // Create a new casing of the correct type
        // By creating it at [0,0,0] instead of _posATL the time is reduced
        // from around 1.08 ms to 0.08 ms. This is most likely because the
        // engine doesn't create the object exactly where it is told to, but
        // instead looks for a suitable position. Creating at origin prevents
        // that from happening.
        _casing = _casingType createVehicleLocal [0,0,0];
    };

    _casing setposATL _posATL;
    _casing setdir (random 360);

    // Store newly created casing
    GVAR(casings) set [GVAR(currentIndex), _casing];
    // Update storage index
    GVAR(currentIndex) = (GVAR(currentIndex) + 1) % GVAR(maxCasings);

    TRACE_3("", _casing, _posATL, GVAR(currentIndex));

    END_COUNTER(fnc_fireEH_create);
}, [_casingType, _posATL], 0.4] call CBA_fnc_waitAndExecute;

END_COUNTER(fnc_fireEH);
