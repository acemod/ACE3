#include "script_component.hpp"
/*
 * Author: mharis001
 * Checks if the player can drink directly from the given water source.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Water Source <OBJECT>
 *
 * Return Value:
 * Can Drink From Source <BOOL>
 *
 * Example:
 * [_player, _source] call ace_field_rations_canDrinkFromSource
 *
 * Public: No
 */

params ["_player", "_source"];

XGVAR(waterSourceActions) == 2 && {
    private _water = _source call FUNC(getRemainingWater);
    _water == REFILL_WATER_INFINITE || {_water >= DRINK_FROM_SOURCE_AMOUNT}
}
