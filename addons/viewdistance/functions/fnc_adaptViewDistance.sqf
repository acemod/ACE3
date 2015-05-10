/*
 * Author: Winter
 * Sets the player's current view distance according to whether s/he is on foot, in a land vehicle or in an air vehicle.
 * 
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_viewdistance_fnc_adaptViewDistance;
 *
 * Public: Yes
 */

#include "script_component.hpp"

private["_land_vehicle","_air_vehicle"];

_land_vehicle = (vehicle player) isKindOf "LandVehicle";
_air_vehicle = (vehicle player) isKindOf "Air";

if (!_land_vehicle && !_air_vehicle) exitWith {
    [GVAR(viewDistanceOnFoot),true] call FUNC(changeViewDistance);
};

if (_land_vehicle) exitWith {
    [GVAR(viewDistanceLandVehicle),true] call FUNC(changeViewDistance);
};

if (_air_vehicle) exitWith {
    [GVAR(viewDistanceAirVehicle),true] call FUNC(changeViewDistance);
};