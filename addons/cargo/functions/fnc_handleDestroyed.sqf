/*
 * Author: Glowbal
 * Handle object being destroyed.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return value:
 * None
 *
 * Example:
 * [object] call ace_cargo_fnc_handleDestroyed
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle"];

private["_loaded"];

_loaded = _vehicle getVariable [QGVAR(loaded), []];
if (count _loaded == 0) exitWith {};

{
    // TODO deleteVehicle or just delete vehicle? Do we want to be able to recover destroyed equipment?
    deleteVehicle _x;
    //_x setDamage 1;
} count _loaded;

[_vehicle] call FUNC(validateCargoSpace);
