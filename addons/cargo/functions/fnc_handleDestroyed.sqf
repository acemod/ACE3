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
if (_loaded isEqualTo []) exitWith {};

{
    // TODO Do we want to be able to recover destroyed equipment?
    if (_x isEqualType objNull) then {
        deleteVehicle _x;
    };
} count _loaded;

[_vehicle] call FUNC(validateCargoSpace);
