/*
 * Author: Grey-Soldierman
 * Adds actions to load each magazine the player has which is compatible with the targets turret weapon
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: target <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [bob,_target] call ace_mk6mortar_fnc_addLoadMagazineActions
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit","_target"];

private _weapon = (_target weaponsTurret [0]) select 0;

private _listOfMagNames = getArray(configFile >> "cfgWeapons" >> _weapon >> "magazines");

private _list = [];
private _itemCount = [];

// Find any magazines in player inventory compatible with the target turret
{
    private _item = configFile >> "CfgMagazines" >> _x;
    if ([_unit,_x] call EFUNC(common,hasMagazine))then {
        private _index = _list find _item;
        if (_index != -1) then {
            _itemCount set [_index, (_itemCount select _index) + 1];
        } else {
            _list pushBack _item;
            _itemCount pushBack 1;
        };
    };
} forEach _listOfMagNames;

private _children = [];

// Add the actions for each compatible magazine the player has
{
    private _name = getText (_x >> "displayNameShort");
    if (_name isEqualTo "") then {
        _name = getText (_x >> "displayName");
    };
    private _className = configName _x;
    _children pushBack
        [
            [
                format ["Round_%1", _forEachIndex],
                _name,
                getText(_x >> "picture"),
                {[(_this select 2) select 0, _this select 0, 5, (_this select 2) select 1] call FUNC(loadMagazineTimer)},
                {true},
                {},
                ([_target,_className])
            ] call EFUNC(interact_menu,createAction),
            [],
            _unit
        ];
} forEach _list;

_children
