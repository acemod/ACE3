#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * Function to clear an entry from the  cache-database.
 *
 * Arguments:
 * 0: Key <STRING>
 *
 * Return Value:
 * none
 *
 * Example:
 * ["myKey"] call ace_wardrobe_fnc_cache_clear
 *
 * Public: Yes
 */

params [ ["_key", "", [""]] ];

private _map = missionNamespace getVariable [QGVAR(cache), "404"];
_map deleteAt _key;

if (count _map == 0) then { missionNamespace setVariable [QGVAR(cache),nil] };
