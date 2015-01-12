/*
 * Author: commy2
 *
 * Add a unit info type handler.
 *
 * Argument:
 * 0: Type. Can be "Soldier", "Vehicle", "Aircraft", "Ship", "Parachute" or "Any". "Any" will execute for any compatible display (String)
 * 1: Code to execute (Code or String)
 *
 * Return value:
 * ID of the event script (used to remove it later).
 */

private ["_type", "_statement", "_actionsVar", "_id", "_actionIDs", "_actions"];

_type = format ["AGM_onLoadInfo%1", _this select 0];
_statement = _this select 1;

if (typeName _statement == "STRING") then {
  _statement = compile _statement;
};

_actionsVar = missionNamespace getVariable [_type, [-1, [], []]];

_id = (_actionsVar select 0) + 1;
_actionIDs = _actionsVar select 1;
_actions = _actionsVar select 2;

_actionIDs pushBack _id;
_actions pushBack _statement;

missionNamespace setVariable [_type, [_id, _actionIDs, _actions]];

_id
