#include "script_component.hpp"
/*
 * Author: Glowbal
 * Handle object being destroyed. Only runs on server.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [object] call ace_cargo_fnc_handleDestroyed
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
        deleteVehicle _x;
    };
    nil
} count _loaded;

[_vehicle] call FUNC(validateCargoSpace);
