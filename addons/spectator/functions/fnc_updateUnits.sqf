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

// Function only matter on player clients
if !(hasInterface) exitWith {};

if !(_newUnits isEqualTo []) then {
    if (_blacklist) then {
        GVAR(unitWhitelist) = GVAR(unitWhitelist) - _newUnits;
        GVAR(unitBlacklist) append _newUnits;
    } else {
        GVAR(unitBlacklist) = GVAR(unitBlacklist) - _newUnits;
        GVAR(unitWhitelist) append _newUnits;
    };
};

// Reset the filter list (removes any units that no longer apply)
GVAR(unitList) = [];

// Unit filter
_newUnits = [[],allPlayers,allUnits] select GVAR(filterUnits);

// Side filter
private ["_playerSide","_sides"];
_playerSide = side group player;
_sides = [west,east,resistance,civilian];

if (GVAR(filterSides) == 0) then {
    _sides = [_playerSide];
} else {
    {
        if ((_x getFriend _playerSide) < 0.6) then {
            _sides - [_x];
        };
    } forEach _sides;
};

// Filter units and append to list
{
    if (
        (alive _x) &&
        {(_x isKindOf "CAManBase")} &&
        {(side _x) in _sides} && // Side filter
        {!(_x getVariable [QGVAR(isSpectator), false])} // Who watches the watchmen?
    ) then {
        GVAR(unitList) pushBack _x;
    };
} forEach (_newUnits - GVAR(unitBlacklist));

// Apply whitelist
GVAR(unitList) append GVAR(unitWhitelist);
GVAR(unitList) = GVAR(unitList) arrayIntersect GVAR(unitList);
