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

private _mags = magazines _unit;
private _list = [];
private _itemCount = [];
{
    private _item = ConfigFile >> "CfgMagazines" >> _x;
    if (getNumber(_item >> QGVAR(Placeable)) == 1) then {
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
