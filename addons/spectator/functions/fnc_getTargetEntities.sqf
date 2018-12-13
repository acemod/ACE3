#include "script_component.hpp"
/*
 * Author: SilentSpike
 * Gets the possible entities to spectate based on settings.
 * Optionally includes dead units for the list and switching.
 *
 * Arguments:
 * 0: Include dead <BOOL>
 *
 * Return Value:
 * Valid entities <ARRAY>
 *
 * Example:
 * [true] call ace_spectator_fnc_getTargetEntities
 *
 * Public: No
 */

// Include dead units if specified (used by entity list)
private _entities = allUnits;
if (param [0,false]) then { _entities append allDeadMen; };

// Quicker to use local vars that are accessed often in iteration
private _sides = GVAR(availableSides);

// Apply entity filtering
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

// Never include the local player
_entities deleteAt (_entities find player);

// Return no duplicates
_entities arrayIntersect _entities
