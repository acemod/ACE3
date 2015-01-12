/*
 * Author: commy2
 *
 * Remove a unit info type event handler.
 *
 * Argument:
 * 0: Type. Can be "Soldier", "Vehicle", "Aircraft" or "Parachute" (String)
 * 1: ID of the event handler (Number)
 *
 * Return value:
 * None.
 */

private ["_type", "_id", "_actionsVar", "_currentId", "_actionIDs", "_actions"];

_type = format ["AGM_onLoadInfo%1", _this select 0];
_id = _this select 1;

_actionsVar = missionNamespace getVariable [_type, [-1, [], []]];

_currentId = _actionsVar select 0;
_actionIDs = _actionsVar select 1;
_actions = _actionsVar select 2;

_id = _actionIDs find _id;

if (_id == -1) exitWith {};

_actionIDs deleteAt _id;
_actions deleteAt _id;

missionNamespace setVariable [_type, [_currentId, _actionIDs, _actions]];
