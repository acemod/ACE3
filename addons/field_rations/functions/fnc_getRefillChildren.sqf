#include "script_component.hpp"
/*
 * Author: mharis001
 * Returns children actions for refillable items in player's inventory for given water source.
 *
 * Arguments:
 * 0: Water source <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [_source, _player] call ace_field_rations_fnc_getRefillChildren
 *
 * Public: No
 */

params ["_source", "_player"];

// Exit if disabled or source has no water
private _water = _source call FUNC(getRemainingWater);
if (_water == 0 || {_water == REFILL_WATER_DISABLED}) exitWith {[]};

private _actions = [];
private _cfgWeapons = configFile >> "CfgWeapons";
private _cfgMagazines = configFile >> "CfgMagazines";

{
    _x params ["_config", "_items"];
    private _isMagazine = _config == _cfgMagazines;
    {
        private _itemConfig = _config >> _x;
        if (getText (_itemConfig >> QXGVAR(refillItem)) != "" && {_water == REFILL_WATER_INFINITE || {getNumber (_itemConfig >> QXGVAR(refillAmount)) <= _water}}) then {
            private _displayName = format ["%1: %2", LLSTRING(Refill), getText (_itemConfig >> "displayName")];
            private _picture = getText (_itemConfig >> "picture");
            private _action = [_x, _displayName, _picture, FUNC(refillItem), FUNC(canRefillItem), {}, [_x, _itemConfig, _isMagazine]] call EFUNC(interact_menu,createAction);
            _actions pushBack [_action, [], _source];
        };
    } forEach _items;
} forEach [
    [_cfgWeapons, _player call EFUNC(common,uniqueItems)],
    [_cfgMagazines, [magazines _player] call EFUNC(common,uniqueElements)]
];

_actions
