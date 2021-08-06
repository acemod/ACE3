#include "script_component.hpp"
/*
 * Author: mharis001
 * Returns list of unique items in a unit's inventory.
 * Items are cached if unit is ACE_player.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Items <ARRAY>
 *
 * Example:
 * [player] call ace_common_fnc_uniqueItems
 *
 * Public: No
 */

params ["_unit"];

// Use cached items list if unit is ACE_player
if (_unit isEqualTo ACE_player) then {
    if (isNil QGVAR(uniqueItemsCache)) then {
        GVAR(uniqueItemsCache) = keys uniqueUnitItems _unit;
    };
    +GVAR(uniqueItemsCache)
} else {
    keys uniqueUnitItems _unit;
};
