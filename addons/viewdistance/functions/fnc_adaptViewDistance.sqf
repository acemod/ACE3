/*
 * Author: Winter
 * Sets the player's current view distance according to whether s/he is on foot, in a land vehicle or in an air vehicle.
 *
 * Arguments:
 * 0: Show Prompt <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_viewdistance_fnc_adaptViewDistance
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_showPrompt"];

if (!GVAR(enabled) || isNull ACE_player) exitWith {};

private _vehicle = vehicle ACE_player;

ACE_controlledUAV params ["_uav"];
if (!isNull _uav) then {
    TRACE_1("using UAV",ACE_controlledUAV);
    _vehicle = _uav;
};

private _landVehicle = _vehicle isKindOf "LandVehicle" || {_vehicle isKindOf "Ship_F"};
private _airVehicle = _vehicle isKindOf "Air";

if (!_landVehicle && !_airVehicle) exitWith {
    [GVAR(viewDistanceOnFoot), _showPrompt] call FUNC(changeViewDistance);
};

if (_landVehicle) exitWith {
    [GVAR(viewDistanceLandVehicle), _showPrompt] call FUNC(changeViewDistance);
};

if (_airVehicle) exitWith {
    [GVAR(viewDistanceAirVehicle), _showPrompt] call FUNC(changeViewDistance);
};
