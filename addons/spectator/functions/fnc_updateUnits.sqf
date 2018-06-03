/*
 * Author: SilentSpike
 * Adds and removed units from the spectator list. Local effect.
 *
 * Arguments:
 * 0: Units to show in the list <ARRAY>
 * 1: Units to hide in the list <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [allPlayers, [player]] call ace_spectator_fnc_updateUnits
 *
 * Public: Yes
 */

#include "script_component.hpp"

// Function only matters on player clients
if (!hasInterface) exitWith {};

params [["_addUnits",[],[[]]], ["_removeUnits",[],[[]]]];

// Add to the whitelist and prevent list overlap
GVAR(unitBlacklist) = GVAR(unitBlacklist) - _addUnits;
GVAR(unitWhitelist) append _addUnits;

// Blacklist overrides the whitelist
GVAR(unitWhitelist) = GVAR(unitWhitelist) - _removeUnits;
GVAR(unitBlacklist) append _removeUnits;
