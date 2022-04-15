#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Adds actions to a drone
 *
 * Arguments:
 * 0: vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [v] call ace_aircraft_fnc_droneAddActions
 *
 * Public: No
 */

params ["_vehicle"];
TRACE_1("droneAddActions",_vehicle);

if (!alive _vehicle) exitWith {};
if (_vehicle getVariable [QGVAR(droneActionsAdded), false]) exitWith {};
_vehicle setVariable [QGVAR(droneActionsAdded), true];

// move to location
private _condition = {
    params ["_vehicle"];
    (missionNamespace getVariable [QGVAR(droneWaypoints), true]) && {waypointsEnabledUAV _vehicle} && {(ACE_controlledUAV select 2) isEqualTo [0]}
};
private _statement = {
    params ["_vehicle"];
    private _group = group driver _vehicle;
    private _pos = ([_vehicle, [0]] call FUNC(droneGetTurretTargetPos)) select 0;
    [QGVAR(droneSetWaypoint), [_vehicle, _group, _pos, "MOVE"], _group] call CBA_fnc_targetEvent;
};
private _action = [QGVAR(droneSetWaypointMove), localize "$STR_AC_MOVE", 
    "\a3\3DEN\Data\CfgWaypoints\Move_ca.paa", _statement, _condition] call EFUNC(interact_menu,createAction);
[_vehicle, 1, ["ACE_SelfActions"], _action] call EFUNC(interact_menu,addActionToObject);


if (_vehicle isKindOf "Air") then {
    // loiter at location
    _condition = {
        params ["_vehicle"];
        (missionNamespace getVariable [QGVAR(droneWaypoints), true]) && {waypointsEnabledUAV _vehicle} && {(ACE_controlledUAV select 2) isEqualTo [0]}
    };
    _statement = {        
        params ["_vehicle"];
        private _group = group driver _vehicle;
        private _pos = ([_vehicle, [0]] call FUNC(droneGetTurretTargetPos)) select 0;
        [QGVAR(droneSetWaypoint), [_vehicle, _group, _pos, "LOITER"], _group] call CBA_fnc_targetEvent;
    };
    _action = [QGVAR(droneSetWaypointLoiter), localize "$STR_AC_LOITER", 
        "\a3\3DEN\Data\CfgWaypoints\Loiter_ca.paa", _statement, _condition] call EFUNC(interact_menu,createAction);
    [_vehicle, 1, ["ACE_SelfActions"], _action] call EFUNC(interact_menu,addActionToObject);


    // set height
    _condition = {
        params ["_vehicle"];
        (missionNamespace getVariable [QGVAR(droneWaypoints), true]) && {waypointsEnabledUAV _vehicle} && {(ACE_controlledUAV select 2) isEqualTo [0]}
    };    
    _statement = {
        params ["_vehicle", "", "_args"];
        private _group = group driver _vehicle;
        [QGVAR(droneModifyWaypoint), [_vehicle, _group, "height", _args], _group] call CBA_fnc_targetEvent;
    };
    _action = [QGVAR(setAltitude), localize "$STR_3den_waypoint_attribute_loiteraltitude_displayname", 
        "", {}, _condition] call EFUNC(interact_menu,createAction);
    private _base = [_vehicle, 1, ["ACE_SelfActions"], _action] call EFUNC(interact_menu,addActionToObject);
    {
        _action = [str _x, str _x, "", _statement, { true }, {}, _x] call EFUNC(interact_menu,createAction);
        [_vehicle, 1, _base, _action] call EFUNC(interact_menu,addActionToObject);
    } forEach [20, 50, 200, 500, 2000];


    // set loiter radius
    _condition = {
        params ["_vehicle"];
        private _group = group driver _vehicle;
        private _index = (currentWaypoint _group) min count waypoints _group;
        private _waypoint = [_group, _index];
        (missionNamespace getVariable [QGVAR(droneWaypoints), true]) && {waypointsEnabledUAV _vehicle} && {(ACE_controlledUAV select 2) isEqualTo [0]} 
        && {(waypointType _waypoint) == "LOITER"}
    };    
    _statement = {
        params ["_vehicle", "", "_args"];
        private _group = group driver _vehicle;
        [QGVAR(droneModifyWaypoint), [_vehicle, _group, "radius", _args], _group] call CBA_fnc_targetEvent;
    };
    _action = [QGVAR(lotierRadius), localize "$STR_3den_waypoint_attribute_loiterradius_displayname", 
        "", {}, _condition] call EFUNC(interact_menu,createAction);
    _base = [_vehicle, 1, ["ACE_SelfActions"], _action] call EFUNC(interact_menu,addActionToObject);
    {
        _action = [str _x, str _x, "", _statement, { true }, {}, _x] call EFUNC(interact_menu,createAction);
        [_vehicle, 1, _base, _action] call EFUNC(interact_menu,addActionToObject);
    } forEach [500, 750, 1000, 1250, 1500];


    // set loiter direction
    _condition = {
        params ["_vehicle", "", "_args"];
        private _group = group driver _vehicle;
        private _index = (currentWaypoint _group) min count waypoints _group;
        private _waypoint = [_group, _index];

        (missionNamespace getVariable [QGVAR(droneWaypoints), true]) && {waypointsEnabledUAV _vehicle} && {(ACE_controlledUAV select 2) isEqualTo [0]} 
        && {(waypointType _waypoint) == "LOITER"} && {(waypointLoiterType _waypoint) != _args}
    };
    _statement = {
        params ["_vehicle", "", "_args"];
        private _group = group driver _vehicle;
        [QGVAR(droneModifyWaypoint), [_vehicle, _group, "dir", _args], _group] call CBA_fnc_targetEvent;
    };
    _action = [QGVAR(lotierTypeR), localize "$STR_3den_waypoint_attribute_loiterdirection_displayname", 
        "\a3\3DEN\Data\Attributes\LoiterDirection\cw_ca.paa", _statement, _condition, {}, "CIRCLE"] call EFUNC(interact_menu,createAction);
    [_vehicle, 1, ["ACE_SelfActions"], _action] call EFUNC(interact_menu,addActionToObject);
    _action = [QGVAR(lotierTypeR), localize "$STR_3den_waypoint_attribute_loiterdirection_displayname", 
        "\a3\3DEN\Data\Attributes\LoiterDirection\ccw_ca.paa", _statement, _condition, {}, "CIRCLE_L"] call EFUNC(interact_menu,createAction);
    [_vehicle, 1, ["ACE_SelfActions"], _action] call EFUNC(interact_menu,addActionToObject);
};
