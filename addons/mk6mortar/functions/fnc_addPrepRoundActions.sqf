#include "script_component.hpp"
/*
 * Author: Grey-Soldierman
 * Adds the actions to prep each compatible magazine in the players inventory
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [bob] call ace_mk6mortar_fnc_addPrepRoundActions
 *
 * Public: No
 */

params ["_unit"];

private _mags = magazines _unit;
private _list = [];
private _itemCount = [];

//Find all the magazines the player has which use the charge system
{
    private _item = configFile >> "CfgMagazines" >> _x;
    if (getNumber(_item >> QGVAR(hasCharges)) == 1) then {
        private _index = _list find _item;
        if (_index != -1) then {
            _itemCount set [_index, (_itemCount select _index) + 1];
        } else {
            _list pushBack _item;
            _itemCount pushBack 1;
        };
    };
} forEach _mags;

private _children = [];

// Add actions for each compatible magazine
{
    private _name = getText (_x >> "displayNameShort");
    if (_name isEqualTo "") then {
        _name = getText (_x >> "displayName");
    };
    _children pushBack
        [
            [
                format ["Round_%1", _forEachIndex],
                format [_name + " (%1)", _itemCount select _forEachIndex],
                getText(_x >> "picture"),
                {""},
                {true},
                {[_this select 0, _this select 2] call FUNC(addChargeActions)},
                (configName _x)
            ] call EFUNC(interact_menu,createAction),
            [],
            _unit
        ];
} forEach _list;

_children
