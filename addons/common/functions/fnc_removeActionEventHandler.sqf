#include "script_component.hpp"
/*
 * Author: commy2
 * Remove an addAction event from a unit.
 *
 * Arguments:
 * 0: Unit the action is assigned to <OBJECT>
 * 1: Name of the action, e.g. "DefaultAction" <STRING>
 * 2: ID of the action <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, "DefaultAction", 5] call ace_common_fnc_removeActionEventHandler
 *
 * Public: No
 */

params ["_unit", "_action", "_id"];

if (_id == -1) exitWith {};

private _name = format ["ACE_Action_%1", _action];
private _actionsVar = _unit getVariable [_name, [-1, [-1, [], []], objNull]];

_actionsVar params ["_actionID", "_actionsArray"];
_actionsArray params ["_currentID", "_actionIDs", "_actions"];

if (_unit != _actionsVar select 2) exitWith {};

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

_unit setVariable [_name, [_actionID, [_currentID, _actionIDs, _actions], _unit], false];
