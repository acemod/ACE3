/*
 * Author: commy2
 * Add an addAction event to a unit. Used to handle multiple addAction events and add a action to the mouse wheel menu. Global arguments, local effects. Does only work for player controlled units.
 *
 * Arguments:
 * 0: Unit the action should be assigned to <OBJECT>
 * 1: Menu title of the action <STRING>
 * 2: Name of the action, e.g. "DefaultAction" <STRING>
 * 3: Condition <CODE, STRING>
 * 4: Code to execute by the action <CODE, STRING>
 * 5: Condition for the menu action <CODE, STRING>
 * 6: Code to execute from the menu <CODE, STRING>
 * 7: Priority of the action (default: 0) <NUMBER>
 *
 * Return Value:
 * ID of the action (used to remove it later) <NUMBER>
 *
 * Example:
 * [bob, "Title", "DefaultAction", "condition", "execute", "conditionmenu", "executemenu", 5] call ace_common_fnc_addActionMenuEventHandler
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_displayName", "_action", "_condition", "_statement", "_condition2", "_statement2", ["_priority", 0]];

if (_condition isEqualType "") then {
    _condition = compile _condition;
};

if (_statement isEqualType "") then {
    _statement = compile _statement;
};

if (_condition2 isEqualType "") then {
    _condition2 = compile _condition2;
};

if (_statement2 isEqualType "") then {
    _statement2 = compile _statement2;
};

private _name = format ["ACE_ActionMenu_%1", _action];
private _actionsVar = _unit getVariable [_name, [-1, [], []]];

_actionsVar params ["_id", "_actionIDs", "_actions"];

_id = _id + 1;

private _nameVar = format ["%1_ID%2", _name, _id];
missionNamespace setVariable [_nameVar, [_condition, _statement, _condition2, _statement2]];

_actionIDs pushBack _id;

private _addAction = call compile format [
    "[
        '%2',
        {[{if (inputAction '%1' == 0) then {if (_this call (%3 select 2)) then {_this call (%3 select 3)}} else {_this call (%3 select 1)}}, _this] call CBA_fnc_directCall},
        nil,
        %4,
        false,
        true,
        '%1',
        ""if (_this != ACE_player || {vehicle _this != _target}) exitWith {false}; [_target, _this] call (%3 select 0)""
    ]",
    _action,
    _displayName,
    _nameVar,
    _priority
];

private _actionID = _unit addAction _addAction;

_actions pushBack [_actionID, _nameVar];

_unit setVariable [_name, [_id, _actionIDs, _actions], false];

_id
