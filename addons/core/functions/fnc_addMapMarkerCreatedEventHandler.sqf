/*
 * Author: commy2
 *
 * Add a map marker creation event handler.
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

_actionsVar = missionNamespace getVariable ["AGM_EventHandler_MapMarker", [-1, [], []]];

_id = (_actionsVar select 0) + 1;
_actionIDs = _actionsVar select 1;
_actions = _actionsVar select 2;

if (_id == 0) then {
  uiNamespace setVariable ["AGM_EventHandler_MapMarker", count allMapMarkers];
  ("AGM_EventHandlerHelper2" call BIS_fnc_rscLayer) cutRsc ["AGM_EventHandlerHelper2", "PLAIN"];
};

_actionIDs pushBack _id;
_actions pushBack _statement;

missionNamespace setVariable ["AGM_EventHandler_MapMarker", [_id, _actionIDs, _actions]];

_id
