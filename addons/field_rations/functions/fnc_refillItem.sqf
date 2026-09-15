#include "..\script_component.hpp"
/*
 * Author: mharis001, Glowbal, PabstMirror
 * Refills an item from given water source.
 *
 * Arguments:
 * 0: Water source <OBJECT>
 * 1: Player <OBJECT>
 * 2: Item data <ARRAY>
 *    0: Item classname <STRING>
 *    1: Item config <CONFIG>
 *    2: Is item magazine <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_source, _player, ["ACE_WaterBottle_Empty", configFile >> "CfgWeapons" >> "ACE_WaterBottle_Empty", false]] call ace_field_rations_fnc_refillItem
 *
 * Public: No
 */

params ["_source", "_player", "_itemData"];
_itemData params ["_item", "_config", "_isMagazine"];
TRACE_3("Item refill started",_source,_player,_item);

// Get config values for refill
private _refillItem = getText (_config >> QXGVAR(refillItem));
private _refillAmount = getNumber (_config >> QXGVAR(refillAmount));
private _refillTime = getNumber (_config >> QXGVAR(refillTime));

private _fnc_onSuccess = {
    params ["_args"];
    _args params ["_source", "_player", "_itemData", "_refillItem", "_refillAmount"];
    _itemData params ["_item", "", "_isMagazine"];
    TRACE_1("Refill item successful",_args);

    // Replace item with refilled one
    if (_isMagazine) then {
        _player removeMagazineGlobal _item;
    } else {
        _player removeItem _item;
    };
    [_player, _refillItem] call EFUNC(common,addToInventory);

    // Update remaining water in source
    private _waterInSource = _source call FUNC(getRemainingWater);
    if (_waterInSource != REFILL_WATER_INFINITE) then {
        _waterInSource = (_waterInSource - _refillAmount) max 0;
        [_source, _waterInSource] call FUNC(setRemainingWater);
    };

    ["acex_rationRefilled", [_source, _player, _item, _refillItem, _refillAmount, _isMagazine]] call CBA_fnc_localEvent;

    // Show refilled item hint
    private _picture = getText (configFile >> "CfgWeapons" >> _refillItem >> "picture");
    [LSTRING(ItemRefilled), _picture] call EFUNC(common,displayTextPicture);
};

private _fnc_onFailure = {
    TRACE_1("Refill item failed",_this);
};

private _fnc_condition = {
    params ["_args"];
    _args call FUNC(canRefillItem);
};

[
    _refillTime,
    [
        _source,
        _player,
        _itemData,
        _refillItem,
        _refillAmount
    ],
    _fnc_onSuccess,
    _fnc_onFailure,
    LLSTRING(Refilling),
    _fnc_condition,
    ["isNotInside"]
] call EFUNC(common,progressBar);
