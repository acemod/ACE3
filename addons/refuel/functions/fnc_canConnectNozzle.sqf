#include "script_component.hpp"
/*
 * Author: QuantX
 * Check if an object can have a nozzle connected to it
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Can nozzle be connected <BOOL>
 *
 * Example:
 * [myVehicle] call ace_refuel_fnc_canConnectNozzle;
 * [myJerryCan] call ace_refuel_fnc_canConnectNozzle;
 *
 * Public: No
 */

params [["_object", objNull, [objNull]]];

// Make sure object doesn't already have a nozzle connected
if (isNull _object || {!isNull(_object getVariable [QGVAR(nozzle), objNull])} ) exitWith {false};

// Can't fuel a jerry can that is connected to another object
if (_object getVariable [QGVAR(jerryCan), false]) exitWith {!(_object getVariable [QGVAR(isConnected), false])};

(getNumber((configOf _object) >> QGVAR(canReceive)) == 1) || {([_object] call FUNC(getCapacity)) != REFUEL_DISABLED_FUEL}