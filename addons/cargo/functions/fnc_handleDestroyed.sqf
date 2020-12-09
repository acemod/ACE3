#include "script_component.hpp"
/*
 * Author: Glowbal
 * Handle object being destroyed.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_object] call ace_cargo_fnc_handleDestroyed
 *
 * Public: No
 */

params ["_vehicle"];
TRACE_1("params",_vehicle);

private _loaded = _vehicle getVariable [QGVAR(loaded), []];
if (_loaded isEqualTo []) exitWith {};

{
    // TODO Do we want to be able to recover destroyed equipment?
    if (_x isEqualType objNull) then {
        detach _x;
        deleteVehicle _x;
    };
} forEach _loaded;

[_vehicle] call FUNC(validateCargoSpace);
