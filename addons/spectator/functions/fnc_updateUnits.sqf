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

private ["_playerSide","_sides","_filteredUnits"];

// Unit setting filter
_newUnits = [[],allPlayers,allUnits] select GVAR(filterUnits);

// Side setting filter
_playerSide = side group player;
if (GVAR(filterSides) == 0) then {
    _sides = [_playerSide];
} else {
    _sides = [west,east,resistance,civilian];
    if (GVAR(filterSides) == 1) then {
        {
            if ((_x getFriend _playerSide) < 0.6) then {
                _sides = _sides - [_x];
            };
        } forEach _sides;
    };
};

// Filter units and append to list
_filteredUnits = [];
{
    if (
        (alive _x) &&
        {(_x isKindOf "CAManBase")} &&
        {(side _x) in _sides} && // Side filter
        {simulationEnabled _x} &&
        {!(_x getVariable [QGVAR(isSpectator), false])} // Who watches the watchmen?
    ) then {
        _filteredUnits pushBack _x;
    };
} forEach (_newUnits - GVAR(unitBlacklist));
_filteredUnits append GVAR(unitWhitelist);

// Replace previous list entirely (removes any no longer valid)
GVAR(unitList) = _filteredUnits arrayIntersect _filteredUnits;
