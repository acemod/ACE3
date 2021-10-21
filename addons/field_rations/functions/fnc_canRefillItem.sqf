#include "script_component.hpp"
/*
 * Author: mharis001, Glowbal, PabstMirror
 * Checks whether the player can refill an item from given water source.
 *
 * Arguments:
 * 0: Water source <OBJECT>
 * 1: Player <OBJECT>
 * 2: Item classname <STRING>
 *
 * Return Value:
 * Can refill item <BOOL>
 *
 * Example:
 * [_source, _player, "ACE_WaterBottle_Empty"] call ace_field_rations_fnc_canRefillItem
 *
 * Public: No
 */

params ["_source", "_player", "_item"];

alive _source
&& {XGVAR(waterSourceActions) != 0}
&& {_item in (_player call EFUNC(common,uniqueItems))}
&& {
    private _water = _source call FUNC(getRemainingWater);
    _water == REFILL_WATER_INFINITE || {_water >= getNumber (configFile >> "CfgWeapons" >> _item >> QXGVAR(refillAmount))}
}
