#include "script_component.hpp"
/*
 * Author: mharis001
 * Returns HashMap of unique items in a unit's inventory.
 * Items are cached if unit is ACE_player.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Items HashMap <HASHMAP>
 *
 * Example:
 * [player] call ace_common_fnc_uniqueItems
 *
 * Public: No
 */

params ["_unit"];

// Use cached items list if unit is ACE_player
if (_unit isEqualTo ACE_player) then {
    missionNamespace getVariable [QGVAR(uniqueItemsCache), uniqueUnitItems _unit]; // only for iteration, NOT modification
} else {
    uniqueUnitItems _unit;
};
