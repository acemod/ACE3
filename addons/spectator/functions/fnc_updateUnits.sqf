/*
 * Author: SilentSpike
 * Updates the list of units available to spectate via addition/subtraction
 *
 * Arguments:
 * 0: Units to add to the list <ARRAY>
 * 1: Add or remove units <BOOL> <OPTIONAL>
 * 2: Permanent change (force add/remove) <BOOL> <OPTIONAL>
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

params [["_newUnits",[]],["_append",true,[true]],["_permanent",false,[false]]];

if (_permanent) then {
    if (_append) then {
        GVAR(unitBlacklist) = GVAR(unitBlacklist) - _newUnits;
        GVAR(unitWhitelist) append _newUnits;
    } else {
        GVAR(unitWhitelist) = GVAR(unitWhitelist) - _newUnits;
        GVAR(unitBlacklist) append _newUnits;
    };
    _newUnits = [];
};

if (_append) then {
    // Append only valid units to the list
    {
        if (
            (alive _x) &&
            {(_x isKindOf "CAManBase")} &&
            {(side _x) in [west,east,resistance,civilian]} && // Side filter
            {(isPlayer _x) || GVAR(allowAI)} && // AI restriction
            {(simulationEnabled _x) && !isObjectHidden _unit} &&
            {!(_x getVariable [QGVAR(isSpectator), false])} // Who watches the watchmen?
        ) then {
            GVAR(unitList) pushBack _x;
        };
    } forEach _newUnits;
} else {
    GVAR(unitList) = GVAR(unitList) - _newUnits;
};

// Apply whitelist and blacklist
GVAR(unitList) append GVAR(unitWhitelist);
GVAR(unitList) = GVAR(unitList) - GVAR(unitBlacklist);

GVAR(unitList) arrayIntersect GVAR(unitList);
