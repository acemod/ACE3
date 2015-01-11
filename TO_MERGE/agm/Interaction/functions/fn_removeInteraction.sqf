/*
 * Author: commy2
 *
 * Remove an AGM action from an object. Note: This function is global.
 * 
 * Argument:
 * 0: Object (Object)
 * 1: ID of the action (Number)
 * 
 * Return value:
 * None.
 */

private ["_object", "_id", "_actionsVar", "_currentID", "_actionIDs", "_actions"];

_object = _this select 0;
_id = _this select 1;

_actionsVar = _object getVariable ["AGM_Interactions", [-1, [], []]];

_currentID = _actionsVar select 0;
_actionIDs = _actionsVar select 1;
_actions = _actionsVar select 2;

_id = _actionIDs find _id;

if (_id == -1) exitWith {};

_actionIDs set [_id, -1];
_actionIDs = _actionIDs - [-1];

_actions set [_id, []];
_actions = _actions - [[]];

_object setVariable ["AGM_Interactions", [_currentID, _actionIDs, _actions], true];
