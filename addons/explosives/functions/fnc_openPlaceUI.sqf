/*
 * Author: Garth 'L-H' de Wet
 * Opens the UI for explosive placement selection
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ACE_Explosives_fnc_openPlaceUI;
 *
 * Public: No
 */
#include "script_component.hpp"
private ["_unit","_mags", "_item", "_index", "_actions"];
_unit = _this select 0;
call FUNC(place_Cancel);

_mags = magazines _unit;
_list = [];
_itemCount = [];
{
    _item = ConfigFile >> "CfgMagazines" >> _x;
    if (getNumber(_item >> "ACE_Placeable") == 1) then {
        _index = _list find _item;
        if (_index != -1) then {
            _itemCount set [_index, (_itemCount select _index) + 1];
        } else {
            _list pushBack _item;
            _itemCount pushBack 1;
        };
    };
} forEach _mags;
_actions = [localize "STR_ACE_Explosives_PlaceMenu", localize "STR_ACE_Explosives_Place"]
    call EFUNC(interaction,prepareSelectMenu);
{
    _actions = [
        _actions,
        format [getText(_x >> "displayName") + " (%1)", _itemCount select _foreachIndex],
        getText(_x >> "picture"),
        configName _x
    ] call EFUNC(interaction,AddSelectableItem);
} foreach _list;

[
    _actions,
    {
        [_this] call FUNC(openTriggerSelectionUI);
    },
    {
        call EFUNC(interaction,hideMenu);
    }
] call EFUNC(interaction,openSelectMenu);
