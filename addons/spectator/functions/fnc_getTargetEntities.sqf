/*
 * Author: SilentSpike
 * Gets the possible entities to spectate based on settings
 *
 * Public: No
 */

#include "script_component.hpp"

// Quicker to use local vars that are accessed often in iteration
private _whitelist = GVAR(unitWhitelist);
private _blacklist = GVAR(unitBlacklist);
private _sides = GVAR(availableSides);

private _entities = [];

// AI filter
if (GVAR(enableAI)) then {
    _entities = allUnits;
} else {
    _entities = [] call CBA_fnc_players;
};

// Whitelist overrides AI setting
_entities append _whitelist;
_entities = _entities arrayIntersect _entities; // No duplicates

// Whitelist overrides side settings, but not simulation/hidden filtering
_entities select {
    ((side group _x) in _sides || {_x in _whitelist}) &&
    {simulationEnabled _x && {simulationEnabled vehicle _x}} &&
    { !isObjectHidden _x && {!isObjectHidden vehicle _x} } &&
    {!(_x in _blacklist)}
}
