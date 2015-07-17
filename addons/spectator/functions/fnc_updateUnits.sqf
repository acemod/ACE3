/*
 * Author: SilentSpike
 * Adds units to spectator whitelist/blacklist and refreshes the filter units
 *
 * Arguments:
 * 0: Units to add to the list <ARRAY>
 * 1: Use blacklist <BOOL> <OPTIONAL>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [allUnits,true] call ace_spectator_fnc_updateUnits
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_newUnits",[],[[]]],["_blacklist",false,[false]]];

if !(_newUnits isEqualTo []) then {
    if (_blacklist) then {
        GVAR(unitWhitelist) = GVAR(unitWhitelist) - _newUnits;
        GVAR(unitBlacklist) append _newUnits;
    } else {
        GVAR(unitBlacklist) = GVAR(unitBlacklist) - _newUnits;
        GVAR(unitWhitelist) append _newUnits;
    };
};

// Get filter units from setting
_newUnits = [[],allPlayers,allUnits] select GVAR(filterUnits);

// Append only valid units to the list
{
    if (
        (alive _x) &&
        {(_x isKindOf "CAManBase")} &&
        {(side _x) in [west,east,resistance,civilian]} && // Side filter
        {(simulationEnabled _x)} &&
        {!(_x getVariable [QGVAR(isSpectator), false])} // Who watches the watchmen?
    ) then {
        GVAR(unitList) pushBack _x;
    };
} forEach (_newUnits - GVAR(unitBlacklist));

// Apply whitelist
GVAR(unitList) append GVAR(unitWhitelist);
GVAR(unitList) = GVAR(unitList) arrayIntersect GVAR(unitList);
