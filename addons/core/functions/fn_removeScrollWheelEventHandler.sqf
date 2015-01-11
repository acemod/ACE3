/*
 * Author: commy2
 *
 * Remove a scroll wheel event handler.
 *
 * Argument:
 * 0: ID of the event handler (Number)
 *
 * Return value:
 * None.
 */

private ["_id", "_actionsVar", "_currentId", "_actionIDs", "_actions"];

_id = _this select 0;

_actionsVar = missionNamespace getVariable ["AGM_EventHandler_ScrollWheel", [-1, [], []]];

_currentId = _actionsVar select 0;
_actionIDs = _actionsVar select 1;
_actions = _actionsVar select 2;

_id = _actionIDs find _id;

if (_id == -1) exitWith {};

_actionIDs set [_id, -1];
_actionIDs = _actionIDs - [-1];

_actions set [_id, []];//{}
_actions = _actions - [[]];//[{}]

missionNamespace setVariable ["AGM_EventHandler_ScrollWheel", [_currentId, _actionIDs, _actions]];
