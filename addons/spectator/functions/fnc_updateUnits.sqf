/*
 * Author: SilentSpike
 * Adds units to spectator whitelist/blacklist. Local effect.
 *
 * Arguments:
 * 0: Units to add to the whitelist <ARRAY>
 * 1: Use blacklist <BOOL> (default: false)
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [allPlayers,true] call ace_spectator_fnc_updateUnits
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_newUnits",[],[[]]],["_blacklist",false,[false]]];

// Function only matters on player clients
if (!hasInterface) exitWith {};

// If input is empty do nothing
if !(_newUnits isEqualTo []) then {
    // Blacklist and whitelist should contain no overlap
    if (_blacklist) then {
        GVAR(unitWhitelist) = GVAR(unitWhitelist) - _newUnits;
        GVAR(unitBlacklist) append _newUnits;
    } else {
        GVAR(unitBlacklist) = GVAR(unitBlacklist) - _newUnits;
        GVAR(unitWhitelist) append _newUnits;
    };
};
