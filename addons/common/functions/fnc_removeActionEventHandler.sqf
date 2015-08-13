/*
 * Author: commy2
 *
 * Remove an addAction event from a unit.
 *
 * Arguments:
 * 0: Unit the action is assigned to <OBJECT>
 * 1: Name of the action, e.g. "DefaultAction" (String)
 * 2: ID of the action <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_name", "_actionsVar", "_actionID", "_actions", "_currentID", "_actionIDs"];

params ["_unit", "_action", "_id"];

if (_id == -1) exitWith {};

_name = format ["ACE_Action_%1", _action];

_actionsVar = _unit getVariable [_name, [-1, [-1, [], []], objNull]];
_actionsVar params ["_actionID", "_actions"];

_actions params ["_currentID", "_actionIDs", "_actions"];

if (_unit != _actions) exitWith {};

_id = _actionIDs find _id;

if (_id == -1) exitWith {};

_actionIDs set [_id, -1];
_actionIDs = _actionIDs - [-1];

_actions set [_id, []];
_actions = _actions - [[]];

if (count _actions == 0) then {
    _unit removeAction _actionID;
    _actionID = -1;
};

_unit setVariable [_name, [_actionID, [_currentID, _actionIDs, _actions], _unit], false]; // @todo Test use _actionVar is Posible
