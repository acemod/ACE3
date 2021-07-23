#include "script_component.hpp"
/*
 * Author: severgun
 * Set engine startup delay to specific vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Delay (seconds) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [hemmt, 3.2] call ace_vehicles_fnc_setVehicleStartDelay
 *
 * Public: Yes
 */

params [["_veh", objNull, [objNull]], ["_delay", 0, [99]]];

if (isNull _veh || {!(_veh isKindOf "AllVehicles")}) exitWith {};

_veh setVariable [QGVAR(engineStartDelay), _delay max 0, true];