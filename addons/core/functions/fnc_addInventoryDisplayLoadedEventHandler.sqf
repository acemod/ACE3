/*
 * Author: commy2
 *
 * Add an inventory display opened handler.
 *
 * Argument:
 * 0: Code to execute (Code or String)
 *
 * Return value:
 * ID of the event script (used to remove it later).
 */

private ["_statement", "_actionsVar", "_id", "_actionIDs", "_actions"];

_statement = _this select 0;

if (typeName _statement == "STRING") then {
  _statement = compile _statement;
};

_actionsVar = missionNamespace getVariable ["AGM_onLoadInventory", [-1, [], []]];

_id = (_actionsVar select 0) + 1;
_actionIDs = _actionsVar select 1;
_actions = _actionsVar select 2;

_actionIDs pushBack _id;
_actions pushBack _statement;

missionNamespace setVariable ["AGM_onLoadInventory", [_id, _actionIDs, _actions]];

_id
