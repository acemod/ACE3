#include "script_component.hpp"
/*
 * Author: mharis001
 * Handles an object being deleted by deleting all loaded cargo.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_object] call ace_cargo_fnc_handleDeleted
 *
 * Public: No
 */

params ["_object"];

{
    if (_x isEqualType objNull) then {
        detach _x;
        deleteVehicle _x;
    };
} forEach (_object getVariable [QGVAR(loaded), []]);
