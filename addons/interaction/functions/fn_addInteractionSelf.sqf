/*
 * Author: commy2
 *
 * Add an AGM self action to the player. Execute this on the local machine of the player.
 * 
 * Argument:
 * 0: Name of the action shown in the menu (String)
 * 1: Condition (Code or String)
 * 2: Statement (Code or String)
 * 3: Show the action even if the conditon is not met (Bool or Number)
 * 4: Priority (Number, optional default: 0)
 * 
 * Return value:
 * ID of the action (used to remove it later).
 */



private ["_displayName", "_condition", "_statement", "_showDisabled", "_priority", "_actionsVar", "_id", "_actionIDs", "_actions"];


_displayName = _this select 0;

_condition = _this select 1;
_statement = _this select 2;
_showDisabled = _this select 3;
_priority = _this select 4;

if (typeName _condition == "STRING") then {
	_condition = compile _condition;
};

if (typeName _statement == "STRING") then {
	_statement = compile _statement;
};

if (typeName _showDisabled == "SCALAR") then {
	_showDisabled = _showDisabled > 0;
};

if (isNil "_priority") then {
	_priority = 0;
};

_actionsVar = AGM_player getVariable ["AGM_InteractionsSelf", [-1, [], []]];

_id = (_actionsVar select 0) + 1;
_actionIDs = _actionsVar select 1;
_actions = _actionsVar select 2;

_actionIDs pushBack _id;
_actions pushBack [_displayName, _condition, _statement, _showDisabled, _priority];

AGM_player setVariable ["AGM_InteractionsSelf", [_id, _actionIDs, _actions], false];
_id
