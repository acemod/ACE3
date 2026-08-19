#include "..\script_component.hpp"
/*
 * Author: Brett Mayson
 * Register a tracker to a missile defense system.
 *
 * Arguments:
 * 0: ID - The ID of the missile defense system to modify <STRING>
 * 1: Tracker - The tracker object to register <OBJECT>
 * 2: Range - The range of the tracker in meters. If not provided, defaults to 3000 <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_missile_defense_fnc_registerTracker
 *
 * Public: Yes
 */

params ["_id", "_tracker", ["_range", 3000]];

if (!isServer) exitWith {
    ERROR("missile_defense functions only run on server");
};

private _system = GVAR(systems) getOrDefault [_id, -1];
if (_system isEqualTo -1) exitWith {
    ERROR_1("Missile defense system with ID '%1' does not exist",_id);
};

private _trackers = _system getOrDefault ["trackers", []];
if (_tracker in _trackers) exitWith {
    ERROR_1("Missile defense tracker '%1' already registered",_tracker);
};

_tracker setVariable [QGVAR(system), _id, true];
_tracker setVariable [QGVAR(range), _range, true];

_trackers pushBackUnique _tracker;

[QGVAR(registerTracker), [_id, _tracker]] call CBA_fnc_globalEvent;

TRACE_2("Registered missile defense tracker",_tracker,_id);
