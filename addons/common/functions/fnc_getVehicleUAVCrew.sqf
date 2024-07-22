#include "..\script_component.hpp"
/*
 * Author: commy2
 * Returns array of uav dummy ais.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * UAV Dummy Crew <ARRAY>
 *
 * Example:
 * [car] call ace_common_fnc_getVehicleUAVCrew
 *
 * Public: Yes
 */

params [["_vehicle", objNull, [objNull]]];

(crew _vehicle) select {unitIsUAV _x} // return
