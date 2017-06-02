/*
 * Author: SilentSpike
 * Gets the possible entities to spectate based on settings
 *
 * Public: No
 */

#include "script_component.hpp"

// Quicker to use local vars that are accessed often in iteration
private _sides = GVAR(availableSides);

// Apply entity filtering
private _entities = allUnits;
_entities = _entities select {
    (GVAR(enableAI) || {isPlayer _x}) && // AI setting
    {(side group _x) in _sides} && // Available sides
    {simulationEnabled _x && {simulationEnabled vehicle _x}} && // Hide disabled things
    { !isObjectHidden _x && {!isObjectHidden vehicle _x} } // Hide hidden things
};

// Respect the blacklist
_entities = _entities - GVAR(unitBlacklist);

// Whitelist overrides filtering
_entities append GVAR(unitWhitelist);

// Return no duplicates
_entities arrayIntersect _entities
