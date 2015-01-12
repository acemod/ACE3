/*
 * Author: commy2
 *
 * Remove an ACE self action from the player.
 *
 * Argument:
 * 0: ID of the action (Number)
 *
 * Return value:
 * None.
 */
#include "script_component.hpp"

private ["_id", "_actionsVar", "_currentID", "_actionIDs", "_actions"];


_id = _this select 0;

_actionsVar = ACE_player getVariable [QGVAR(InteractionsSelf), [-1, [], []]];

_currentID = _actionsVar select 0;
_actionIDs = _actionsVar select 1;
_actions = _actionsVar select 2;

_id = _actionIDs find _id;

if (_id == -1) exitWith {};

_actionIDs set [_id, -1];
_actionIDs = _actionIDs - [-1];

_actions set [_id, []];
_actions = _actions - [[]];

ACE_player setVariable [QGVAR(InteractionsSelf), [_currentID, _actionIDs, _actions], false];
