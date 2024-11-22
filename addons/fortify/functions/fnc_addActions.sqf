#include "..\script_component.hpp"
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
private _subActions = createHashMap;

{
    _x params ["_classname", "_cost", ["_category", ""]];

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

    if (_category == "") then {
        _actions pushBack [_action, [], _player];
    } else {
        private _categoryActions = _subActions getOrDefault [_category, [], true];
        _categoryActions pushBack [_action, [], _player];
    };
} forEach _objects;

{
    private _displayName = if (isLocalized _x) then {
        localize _x
    } else {
        if (isText (configFile >> "ACEX_Fortify_Presets" >> _x >> "displayName")) exitWith { getText (configFile >> "ACEX_Fortify_Presets" >> _x >> "displayName") };
        if (isText (missionConfigFile >> "ACEX_Fortify_Presets" >> _x >> "displayName")) exitWith { getText (missionConfigFile >> "ACEX_Fortify_Presets" >> _x >> "displayName") };
        _x
     };
    private _action = [_x, _displayName, "", {}, {true}] call EFUNC(interact_menu,createAction);
    _actions pushBack [_action, _y, _player];
} forEach _subActions;

_actions
