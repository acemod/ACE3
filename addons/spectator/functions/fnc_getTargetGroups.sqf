/*
 * Author: SilentSpike
 * Gets the possible groups to spectate based on settings
 *
 * Public: No
 */

#include "script_component.hpp"

private _groups = [];

// AI filter
if (GVAR(filterUnits) == 3) then {
    _groups = allGroups;
} else {
    private _players = [] call CBA_fnc_players;
    { _groups pushBackUnique (group _x); } forEach _players;
};

// Side and number of units filter
_groups select {
    ((side _x) in GVAR(availableSides)) &&
    {!((units _x) isEqualTo [])}
}
