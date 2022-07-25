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
 
 if (isNull _object) exitWith {false};
 
 private _canConnect = if (_object getVariable [QGVAR(jerryCan), false]) then {
    !(_object getVariable [QGVAR(isConnected), false]) // Can't fuel a jerry can that is connected to another object
} else {
    1 == getNumber (configOf _object >> QGVAR(canReceive)) // Object is configured to recieve fuel
    && {isNull (_object getVariable [QGVAR(nozzle), objNull])} // Object is not already recieving fuel
};

_canConnect;