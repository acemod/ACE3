/*
 * Author: chris579
 * Deletes camouflage from a trench
 *
 * Arguments:
 * 0: trench <OBJECT>
 *
 * Return Value:
 * Can delete <BOOL>
 *
 * Example:
 * [TrenchObj] call ace_trenches_fnc_deleteCamouflage
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_trench"];

{
    deleteVehicle _x;
} forEach (_trench getVariable [QGVAR(camouflageObjects), []]);
_trench setVariable [QGVAR(camouflageObjects), nil, true];
