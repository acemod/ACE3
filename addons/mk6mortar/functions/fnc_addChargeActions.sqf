/*
 * Author: Grey-Soldierman
 * Adds sub actions for each charge for a particular magazine (from insertChildren)
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: magazine <STRING>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [bob, 'ACE_1Rnd_82mm_Mo_HE'] call ace_mk6mortar_fnc_addPrepRoundActions
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit","_magazine"];

private _list = [];
private _itemCount = [];

private _charges = getArray(ConfigFile >> "CfgMagazines" >> _magazine >> QGVAR(charges));

private _list = [];
private _itemCount = [];
// Get the charges for this magazine
{
    private _item = configFile >> "CfgMagazines" >> _x select 0;
    private _index = _list find _item;
    if (_index != -1) then {
        _itemCount set [_index, (_itemCount select _index) + 1];
    } else {
        _list pushBack _item;
        _itemCount pushBack 1;
    };
} forEach _charges;


private _chargeRequirement = 0;
private _children = [];
// Add an action for each charge
{
    private _name = getText (_x >> "displayNameShort");
    if (_name isEqualTo "") then {
        _name = getText (_x >> "displayName");
    };

    private _index = _list find _x;
    private _chargeRequirement = (_charges select _index) select 1;
    private _chargeClass = getText (_x >> QGVAR(chargeClass));
    private _className = configName _x;

    _children pushBack
        [
            [
                format ["Round_%1", _forEachIndex],
                _name,
                getText(_x >> "picture"),
                {
                    [_this select 0, (_this select 2) select 0, (_this select 2) select 1, (_this select 2) select 2, (_this select 2) select 3] call FUNC(prepRoundTimer)
                },
                {true},
                {},
                ([_magazine, _className, _chargeClass, _chargeRequirement])
            ] call EFUNC(interact_menu,createAction),
            [],
            _unit
        ];
} forEach _list;

_children
