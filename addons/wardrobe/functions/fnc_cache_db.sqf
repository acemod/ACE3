#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * Function to retrieve the Cache Database (Hashmap).
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Cache Database <HASHMAP>
 *
 * Example:
 * [] call ace_wardrobe_fnc_cache_db
 *
 * Public: No
 */


private _map = missionNamespace getVariable [QGVAR(cache), "404"];

if (_map isEqualTo "404") then {
    _map = createHashMap;
    missionNamespace setVariable [QGVAR(cache), _map];
};

_map
