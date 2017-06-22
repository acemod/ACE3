/*
 * Author: Garth 'L-H' de Wet and CAA-Picard
 * Adds sub actions for all explosive magazines (from insertChildren)
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [bob] call ace_explosives_fnc_addExplosiveActions
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];
TRACE_1("params",_unit);

private ["_mags", "_item", "_index", "_children", "_itemCount", "_list"];

_mags = magazines _unit;
_list = [];
_itemCount = [];
{
    _item = ConfigFile >> "CfgMagazines" >> _x;
    if (getNumber(_item >> QGVAR(Placeable)) == 1) then {
        _index = _list find _item;
        if (_index != -1) then {
            _itemCount set [_index, (_itemCount select _index) + 1];
        } else {
            _list pushBack _item;
            _itemCount pushBack 1;
        };
    };
} forEach _mags;

_children = [];

{
    private _name = getText (_x >> "displayNameShort");
    if (_name isEqualTo "") then {
        _name = getText (_x >> "displayName");
    };

    _children pushBack
        [
            [
                format ["Explosive_%1", _forEachIndex],
                format [_name + " (%1)", _itemCount select _forEachIndex],
                getText(_x >> "picture"),
                {[{_this call FUNC(setupExplosive)}, _this] call CBA_fnc_execNextFrame},
                {true},
                {},
                (configName _x)
            ] call EFUNC(interact_menu,createAction),
            [],
            _unit
        ];
} forEach _list;

_children
