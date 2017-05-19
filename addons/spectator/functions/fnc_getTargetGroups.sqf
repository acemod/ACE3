/*
 * Author: SilentSpike
 * Gets the possible groups to spectate based on settings
 *
 * Public: No
 */

#include "script_component.hpp"

private _groups = [];

// AI filter
if (GVAR(enableAI)) then {
    _groups = allGroups;
} else {
    private _players = [] call CBA_fnc_players;
    { _groups pushBackUnique (group _x); } forEach _players;
};

// Side and number of units filter
_groups = _groups select {
    ((side _x) in GVAR(availableSides)) &&
    {!((units _x) isEqualTo [])}
};

// Whitelist overrides AI setting and side settings
_groups append (GVAR(unitWhitelist) apply {group _x});
_groups arrayIntersect _groups
