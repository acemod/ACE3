/*
 * Author: commy2
 *
 * Add a camera view event handler. The event script is called when the camera view changes.
 * The argument of the called function is stored in the _this variable and has as first element the new camera mode. Possible arguments are ["INTERNAL"], ["EXTERNAL"], ["GUNNER"] and ["GROUP"].
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

_actionsVar = missionNamespace getVariable ["AGM_EventHandler_CameraMode", [-1, [], []]];

_id = (_actionsVar select 0) + 1;
_actionIDs = _actionsVar select 1;
_actions = _actionsVar select 2;

if (_id == 0) then {
  uiNamespace setVariable ["AGM_EventHandler_CameraMode", cameraView];
  ("AGM_EventHandlerHelper" call BIS_fnc_rscLayer) cutRsc ["AGM_EventHandlerHelper", "PLAIN"];
};

_actionIDs pushBack _id;
_actions pushBack _statement;

missionNamespace setVariable ["AGM_EventHandler_CameraMode", [_id, _actionIDs, _actions]];

_id
