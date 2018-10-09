#include "script_component.hpp"
/*
 * Author: commy2
 * Remove an addAction menu event from a unit.
 *
 * Arguments:
 * 0: Unit the action is assigned to <OBJECT>
 * 1: Name of the action, e.g. "DefaultAction" <STRING>
 * 2: ID of the action <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, "DefaultAction", 5] call ace_common_fnc_removeActionMenuEventHandler
 *
 * Public: No
 */

params ["_unit", "_action", "_id"];

if (_id == -1) exitWith {};

private _name = format ["ACE_ActionMenu_%1", _action];
private _actionsVar = _unit getVariable [_name, [-1, [-1, [], []]]];

_actionsVar params ["_currentID", "_actionIDs", "_actions"];

_id = _actionIDs find _id;

if (_id == -1) exitWith {};

_action = _actions select _id;

_action params ["_actionID", "_nameVar"];

missionNamespace setVariable [_nameVar, nil];

_actionIDs deleteAt _id;
_actions deleteAt _id;

_unit removeAction _actionID;

_unit setVariable [_name, [_currentID, _actionIDs, _actions], false];
