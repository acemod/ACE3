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
 * Public: Yes
 */
#include "script_component.hpp"

params [["_vehicle", objNull, [objNull]]];

crew _vehicle select {getText (configFile >> "CfgVehicles" >> typeOf _x >> "simulation") == "UAVPilot"} // return
