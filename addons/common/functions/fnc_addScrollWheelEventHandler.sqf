/*
 * Author: commy2
 * Add an event handler that executes every ACE_time the scroll wheel is used. This is needed, because adding a MouseZ display event handler to display 46 will break in save games. Argument will be [Interval] where 'Interval' is a number.
 *
 * Arguments:
 * 0: Code to execute <CODE, STRING>
 *
 * Return Value:
 * ID of the event script (used to remove it later). <NUMBER>
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_actionsVar", "_id", "_actionIDs", "_actions"];

params ["_statement"];

if (typeName _statement == "STRING") then {
  _statement = compile _statement;
};

_actionsVar = missionNamespace getVariable ["ACE_EventHandler_ScrollWheel", [-1, [], []]];

_actionsVar params ["_id","_actionIDs","_actions"];
_id = _id + 1;

_actionIDs pushBack _id;
_actions pushBack _statement;

missionNamespace setVariable ["ACE_EventHandler_ScrollWheel", [_id, _actionIDs, _actions]];// Check if _this can be used

_id // Return
