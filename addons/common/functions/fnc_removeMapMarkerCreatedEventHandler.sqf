/*
 * Author: commy2
 *
 * Remove a map marker creation event handler.
 *
 * Arguments:
 * 0: ID of the event handler <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_actionsVar", "_currentId", "_actionIDs", "_actions"];

params ["_id"];

_actionsVar = missionNamespace getVariable ["ACE_EventHandler_MapMarker", [-1, [], []]];
_actionsVar params ["_currentId", "_actionIDs", "_actions"];

_id = _actionIDs find _id;

if (_id == -1) exitWith {};

_actionIDs set [_id, -1];
_actionIDs = _actionIDs - [-1];

_actions set [_id, []];//{}
_actions = _actions - [[]];//[{}]

missionNamespace setVariable ["ACE_EventHandler_MapMarker", [_currentId, _actionIDs, _actions]]; // @todo Test use _actionsVar is Posible
