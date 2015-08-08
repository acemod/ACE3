/*
 * Author: commy2
 * Add a map marker creation event handler.
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

_actionsVar = missionNamespace getVariable ["ACE_EventHandler_MapMarker", [-1, [], []]];

_actionsVar params ["_id","_actionIDs","_actions"];
_id = _id + 1;

if (_id == 0) then {
    uiNamespace setVariable ["ACE_EventHandler_MapMarker", count allMapMarkers];
    ("ACE_EventHandlerHelper2" call BIS_fnc_rscLayer) cutRsc ["ACE_EventHandlerHelper2", "PLAIN"];
};

_actionIDs pushBack _id;
_actions pushBack _statement;

missionNamespace setVariable ["ACE_EventHandler_MapMarker", [_id, _actionIDs, _actions]];

_id // Return
