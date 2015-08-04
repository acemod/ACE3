/*
 * Author: commy2
 *
 * Remove an addAction event from a unit.
 *
 * Argument:
 * 0: Unit the action is assigned to (Object)
 * 1: Name of the action, e.g. "DefaultAction" (String)
 * 2: ID of the action (Number)
 *
 * Return value:
 * None.
 */
#include "script_component.hpp"

private ["_name", "_actionsVar", "_currentID", "_actionIDs", "_actions", "_actionID", "_nameVar"];

params ["_unit", "_action", "_id"];

if (_id == -1) exitWith {};

_name = format ["ACE_ActionMenu_%1", _action];

_actionsVar = _unit getVariable [_name, [-1, [-1, [], []]]];

_currentID = _actionsVar select 0;
_actionIDs = _actionsVar select 1;
_actions = _actionsVar select 2;

_id = _actionIDs find _id;

if (_id == -1) exitWith {};

_action = _actions select _id;
_actionID = _action select 0;
_nameVar = _action select 1;

missionNamespace setVariable [_nameVar, nil];

_actionIDs deleteAt _id;
_actions deleteAt _id;

_unit removeAction _actionID;

_unit setVariable [_name, [_currentID, _actionIDs, _actions], false];
