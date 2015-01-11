/*
 * Author: commy2
 *
 * Add an AGM action to an object. Note: This function is global.
 * 
 * Argument:
 * 0: Object the action should be assigned to (Object)
 * 1: Name of the action shown in the menu (String)
 * 2: Distance the player can be away from the object (Number)
 * 3: Condition (Code or String)
 * 4: Statement (Code or String)
 * 5: Show the action even if the conditon is not met (Bool or Number)
 * 6: Priority (Number, optional default: 0)
 * 
 * Return value:
 * ID of the action (used to remove it later).
 */

private ["_object", "_displayName", "_distance", "_condition", "_statement", "_showDisabled", "_priority", "_actionsVar", "_id", "_actionIDs", "_actions"];

_object = _this select 0;
_displayName = _this select 1;
_distance = _this select 2;
_condition = _this select 3;
_statement = _this select 4;
_showDisabled = _this select 5;
_priority = _this select 6;

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

_actionsVar = _object getVariable ["AGM_Interactions", [-1, [], []]];

_id = (_actionsVar select 0) + 1;
_actionIDs = _actionsVar select 1;
_actions = _actionsVar select 2;

_actionIDs pushBack _id;
_actions pushBack [_displayName, _distance, _condition, _statement, _showDisabled, _priority];

_object setVariable ["AGM_Interactions", [_id, _actionIDs, _actions], true];
_id
