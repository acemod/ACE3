/*
 * Author: Dslyecxi, Jonpas
 * Primes the throwable, creates global throwable vehicle and throws Fired XEH.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit] call ace_advancedthrowing_fnc_prime
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

GVAR(primed) = true;

// Remove item before cooking to prevent weaponselect showing more throwables than there actually are in inventory
private _throwableMag = (currentThrowable _unit) select 0;
_unit removeItem _throwableMag;

private _throwableType = getText (configFile >> "CfgMagazines" >> _throwableMag >> "ammo");
private _muzzle = _throwableMag call FUNC(getMuzzle);

// Create actual throwable globally
private _activeThrowableOld = GVAR(activeThrowable);
GVAR(activeThrowable) = createVehicle [_throwableType, _activeThrowableOld, [], 0, "CAN_COLLIDE"];
deleteVehicle _activeThrowableOld;

// Throw Fired XEH
[QGVAR(throwFiredXEH), [
    _unit, // unit
    "Throw", // weapon
    _muzzle, // muzzle
    _muzzle, // mode
    _throwableType, // ammo
    _throwableMag, // magazine
    GVAR(activeThrowable) // projectile
]] call EFUNC(common,globalEvent);
