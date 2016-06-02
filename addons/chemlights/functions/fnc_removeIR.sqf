/*
 * Author: voiper
 * Kill chemlight when its time expires.
 *
 * Arguments:
 * 1: Chemlight object <OBJECT>
 * 2: Light marker vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_chemlight, _light] call ace_chemlights_fnc_expireChemlight;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_chemlight", "_lightMarker"];

if (!isNull _lightMarker) then {
    detach _lightMarker;
    deleteVehicle _lightMarker;
};
if (!isNull _chemlight) then {
    deleteVehicle _chemlight;
};