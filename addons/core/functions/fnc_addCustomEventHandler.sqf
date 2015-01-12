/*
 * Author: commy2
 *
 * Add a custom event to a unit. The event scripts are called by FUNC(callCustomEventHandlers).
 *
 * Argument:
 * 0: Object the event should be assigned to or namespace (Object OR Namespace)
 * 1: Name of the event (String)
 * 2: Code to execute (Code or String)
 *
 * Return value:
 * ID of the event script (used to remove it later).
 */
#include "\z\ace\addons\core\script_component.hpp"

private ["_object", "_type", "_statement", "_name", "_actionsVar", "_id", "_actionIDs", "_actions"];

_object = _this select 0;
_type = _this select 1;
_statement = _this select 2;

if (typeName _statement == "STRING") then {
  _statement = compile _statement;
};

_name = format ["ACE_CustomEventHandlers_%1", _type];

_actionsVar = _object getVariable [_name, [-1, [], []]];

_id = (_actionsVar select 0) + 1;
_actionIDs = _actionsVar select 1;
_actions = _actionsVar select 2;

_actionIDs pushBack _id;
_actions pushBack _statement;

_object setVariable [_name, [_id, _actionIDs, _actions]];

_id
