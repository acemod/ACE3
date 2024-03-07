#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Starts ammunition detonating from an object.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Destroy when finished <BOOL> (default: false)
 * 2: Source <OBJECT> (default: objNull)
 * 3: Instigator <OBJECT> (default: objNull)
 * 4: Initial delay <NUMBER> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject] call ace_cookoff_fnc_detonateAmmunition
 *
 * Public: No
 */

if (!isServer) exitWith {};

params ["_object", ["_destroyWhenFinished", false], ["_source", objNull], ["_instigator", objNull], ["_initialDelay", 0]];

if (isNull _object) exitWith {};

// Don't have an object detonate its ammo twice
if (_object getVariable [QGVAR(isAmmoDetonating), false]) exitWith {};

_object setVariable [QGVAR(isAmmoDetonating), true, true];

// Save the vehicle's ammo, so it won't be removed during cook-off
if (!GVAR(removeAmmoDuringCookoff)) then {
    _object setVariable [QGVAR(cookoffMagazines), _object call FUNC(getVehicleAmmo)];
};

[FUNC(detonateAmmunitionServer), [_object, _destroyWhenFinished, _source, _instigator], _initialDelay] call CBA_fnc_waitAndExecute;
