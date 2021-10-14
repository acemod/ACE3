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

{
    private _config = _cfgWeapons >> _x;
    if (getText (_config >> QXGVAR(refillItem)) != "" && {_water == REFILL_WATER_INFINITE || {getNumber (_config >> QXGVAR(refillAmount)) <= _water}}) then {
        private _displayName = format ["%1: %2", LLSTRING(Refill), getText (_config >> "displayName")];
        private _picture = getText (_config >> "picture");
        private _action = [_x, _displayName, _picture, FUNC(refillItem), FUNC(canRefillItem), {}, _x] call EFUNC(interact_menu,createAction);
        _actions pushBack [_action, [], _source];
    };
} forEach (_player call EFUNC(common,uniqueItems));

_actions
