/*
 * Author: SilentSpike
 * Adds units to spectator whitelist/blacklist and refreshes the filter units
 *
 * Arguments:
 * 0: Units to add to the whitelist <ARRAY>
 * 1: Use blacklist <BOOL> (default: false)
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

// Function only matters on player clients
if (!hasInterface) exitWith {};

// If adding to a list we can exit here, since it won't show up until the UI refreshes anyway
if !(_newUnits isEqualTo []) exitWith {
    if (_blacklist) then {
        GVAR(unitWhitelist) = GVAR(unitWhitelist) - _newUnits;
        GVAR(unitBlacklist) append _newUnits;
    } else {
        GVAR(unitBlacklist) = GVAR(unitBlacklist) - _newUnits;
        GVAR(unitWhitelist) append _newUnits;
    };
};

// Unit setting filter
private _newUnits = [[],allPlayers,playableUnits,allUnits] select GVAR(filterUnits);

// Side setting filter
private _sideFilter = [
    {_x == (side group player)},
    {(_x getFriend (side group player)) >= 0.6},
    {(_x getFriend (side group player)) < 0.6},
    {true}
] select GVAR(filterSides);

private _filteredSides = GVAR(availableSides) select _sideFilter;

// Filter units and append to list
private _filteredUnits = (_newUnits - GVAR(unitBlacklist)) select {
    (alive _x) &&
    {(_x isKindOf "CAManBase")} &&
    {(side group _x) in _filteredSides} && // Side filter
    {simulationEnabled _x} &&
    {!(_x getVariable [QGVAR(isStaged), false])} // Who watches the watchmen?
};
_filteredUnits append GVAR(unitWhitelist);

// Cache icons and colour for drawing
private _filteredGroups = [];
{
    // Intentionally re-applied to units in case their status changes
    [_x] call FUNC(cacheUnitInfo);
    _filteredGroups pushBackUnique (group _x);
} forEach _filteredUnits;

// Replace previous lists entirely (removes any no longer valid)
GVAR(groupList) = _filteredGroups;
GVAR(unitList) = _filteredUnits arrayIntersect _filteredUnits;
