/*
 * Author: SilentSpike
 * Adds and removed units from the spectator list. Local effect.
 *
 * Arguments:
 * 0: Units to show in the list <ARRAY>
 * 1: Units to hide in the list <ARRAY>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [allPlayers, [player]] call ace_spectator_fnc_updateUnits
 *
 * Public: Yes
 */

#include "script_component.hpp"

// Function only matters on player clients
if (!hasInterface) exitWith {};

params [["_addUnits",[],[[]]], ["_removeUnits",[],[[], true]]];

// Deprecated parameter (remember to remove bool from params when removed)
if (_removeUnits isEqualType true) then {
    ACE_DEPRECATED("Boolean parameter","3.12.0","array (see function header or doc)");
    if (_removeUnits) then {
        _removeUnits = _addUnits;
        _addUnits = [];
    };
};

// Add to the whitelist and prevent list overlap
GVAR(unitBlacklist) = GVAR(unitBlacklist) - _addUnits;
GVAR(unitWhitelist) append _addUnits;

// Blacklist overrides the whitelist
GVAR(unitWhitelist) = GVAR(unitWhitelist) - _removeUnits;
GVAR(unitBlacklist) append _removeUnits;
