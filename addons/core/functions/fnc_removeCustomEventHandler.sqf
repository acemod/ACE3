/*
 * Author: commy2
 *
 * Remove a custom event handler from an object.
 *
 * Argument:
 * 0: Unit the event handler is assigned to or namespace (Object OR Namespace)
 * 1: Name of the event (String)
 * 2: ID of the event handler (Number)
 *
 * Return value:
 * None.
 */

private ["_object", "_type", "_id", "_name", "_actionsVar", "_currentId", "_actionIDs", "_actions"];

_object = _this select 0;
_type = _this select 1;
_id = _this select 2;

_name = format ["AGM_CustomEventHandlers_%1", _type];

_actionsVar = _object getVariable [_name, [-1, [], []]];

_currentId = _actionsVar select 0;
_actionIDs = _actionsVar select 1;
_actions = _actionsVar select 2;

_id = _actionIDs find _id;

if (_id == -1) exitWith {};

_actionIDs set [_id, -1];
_actionIDs = _actionIDs - [-1];

_actions set [_id, []];//{}
_actions = _actions - [[]];//[{}]

_object setVariable [_name, [_currentId, _actionIDs, _actions]];
