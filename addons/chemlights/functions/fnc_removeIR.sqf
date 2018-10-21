#include "script_component.hpp"
/*
 * Author: voiper
 * Kill chemlight and any dummy objects attached to it.
 *
 * Arguments:
 * 0: Chemlight object <OBJECT>
 * 1: Light marker vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_chemlight, _lightMarker] call ace_chemlights_fnc_removeIR;
 *
 * Public: No
 */

params ["_chemlight", "_lightMarker"];

if (!isNull _lightMarker) then {
    detach _lightMarker;
    deleteVehicle _lightMarker;
};
if (!isNull _chemlight) then {
    deleteVehicle _chemlight;
};
