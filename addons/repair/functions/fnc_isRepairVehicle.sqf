/*
 * Author: Glowbal
 * Check if vehicle is a engineeral vehicle
 *
 * Arguments:
 * 0: The Vehicle <OBJECT>
 *
 * ReturnValue:
 * Is in of engineer class <BOOL>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_vehicle"];
TRACE_1("params",_vehicle);

if (_vehicle isKindOf "CAManBase") exitwith {false};

((_vehicle getVariable [QGVAR(engineerClass), getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> QGVAR(canRepair))]) > 0);
