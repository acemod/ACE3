/*
 * Author: Glowbal
 * Check if vehicle is a engineering vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Is engineering vehicle <BOOL>
 *
 * Example:
 * [vehicle] call ace_repair_fnc_isRepairVehicle
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_vehicle"];
TRACE_1("params",_vehicle);

if (_vehicle isKindOf "CAManBase") exitWith {false};

((_vehicle getVariable ["ACE_isRepairVehicle", getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> QGVAR(canRepair))]) > 0);
