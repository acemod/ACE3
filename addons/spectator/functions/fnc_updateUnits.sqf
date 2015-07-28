/*
 * Author: SilentSpike
 * Adds units to spectator whitelist/blacklist and refreshes the filter units
 *
 * Arguments:
 * 0: Units to add to the whitelist <ARRAY>
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

// Function only matters on player clients
if !(hasInterface) exitWith {};

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

private ["_sides","_cond","_filteredUnits","_color","_icon"];

// Unit setting filter
_newUnits = [[],allPlayers,allUnits] select GVAR(filterUnits);

// Side setting filter
_sides = [];
_cond = [{_this == (side group player)},{(_this getFriend (side group player)) >= 0.6},{(_this getFriend (side group player)) < 0.6},{true}] select GVAR(filterSides);
{
    if (_x call _cond) then {
        _sides pushBack _x;
    };
} forEach GVAR(availableSides);

// Filter units and append to list
_filteredUnits = [];
{
    if (
        (alive _x) &&
        {(_x isKindOf "CAManBase")} &&
        {(side group _x) in _sides} && // Side filter
        {simulationEnabled _x} &&
        {!(_x getVariable [QGVAR(isSpectator), false])} // Who watches the watchmen?
    ) then {
        _filteredUnits pushBack _x;
    };
} forEach (_newUnits - GVAR(unitBlacklist));
_filteredUnits append GVAR(unitWhitelist);

// Cache icons and colour for drawing
{
    // Intentionally re-applied to units in case their status changes
    [_x] call FUNC(cacheUnitInfo);
} forEach _filteredUnits;

// Replace previous list entirely (removes any no longer valid)
GVAR(unitList) = _filteredUnits arrayIntersect _filteredUnits;
