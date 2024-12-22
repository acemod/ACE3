#include "..\script_component.hpp"
/*
 * Author: mharis001, Glowbal, PabstMirror
 * Checks whether the player can refill an item from given water source.
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
 * Can refill item <BOOL>
 *
 * Example:
 * [_source, _player, ["ACE_WaterBottle_Empty", configFile >> "CfgWeapons" >> "ACE_WaterBottle_Empty", false]] call ace_field_rations_fnc_canRefillItem
 *
 * Public: No
 */

params ["_source", "_player", "_itemData"];
_itemData params ["_item", "_itemConfig", "_isMagazine"];

alive _source
&& {XGVAR(waterSourceActions) != 0}
&& {
    (_isMagazine && {_item in magazines _player})
    || {_item in (_player call EFUNC(common,uniqueItems))}
}
&& {
    private _water = _source call FUNC(getRemainingWater);
    _water == REFILL_WATER_INFINITE || {_water >= getNumber (_itemConfig >> QXGVAR(refillAmount))}
}
