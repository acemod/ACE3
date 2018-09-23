#include "script_component.hpp"
/*
 * Author: mharis001, PabstMirror
 * Returns list of unique items in ACE_player's inventory.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Items <ARRAY>
 *
 * Example:
 * call ace_common_fnc_uniqueItemsPlayer
 *
 * Public: No
 */

if (isNil QGVAR(uniqueItemsCache)) then {
    GVAR(uniqueItemsCache) = (getItemCargo uniformContainer ACE_player) select 0;
    GVAR(uniqueItemsCache) append ((getItemCargo vestContainer ACE_player) select 0);
    GVAR(uniqueItemsCache) append ((getItemCargo backpackContainer ACE_player) select 0);
    GVAR(uniqueItemsCache) arrayIntersect GVAR(uniqueItemsCache)
};
+GVAR(uniqueItemsCache)
