#include "script_component.hpp"
/*
 * Author: Kingsley
 * Adds the child actions.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [player] call ace_fortify_fnc_addActions
 *
 * Public: No
 */

params ["_player"];

private _side = side group _player;
private _objects = missionNamespace getVariable [format [QGVAR(Objects_%1), _side], []];
private _actions = [];
private _infiniteBudget = ([side group _player] call FUNC(getBudget)) == -1;

{
    _x params ["_classname", "_cost"];

    private _displayName = getText (configFile >> "CfgVehicles" >> _classname >> "displayName");

    private _action = [
        _classname,
        if (_infiniteBudget) then { _displayName } else { format ["$%1 - %2", _cost, _displayName] },
        "",
        LINKFUNC(deployObject),
        {
            params ["", "_player", "_args"];

            private _cost = _args call FUNC(getCost);
            private _budget = [side group _player] call FUNC(getBudget);
            _budget == -1 || {_budget >= _cost}
        },
        {},
        [_side, _classname]
    ] call EFUNC(interact_menu,createAction);

    _actions pushBack [_action, [], _player];
} forEach _objects;

_actions
