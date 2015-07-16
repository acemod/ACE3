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

_newUnits = _this select 0;
_append = if (count _this > 1) then {_this select 1} else {true};
_permanent = if (count _this > 2) then {_this select 2} else {false};

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
    _newUnits = _newUnits - GVAR(unitList);

    // Append only valid units to the list
    {
        if (
            (_x isKindOf "CAManBase") &&
            {(side _x) in [west,east,resistance,civilian]} &&
            {(isPlayer _x) || GVAR(allowAI)} && // AI restriction
            {(simulationEnabled _x)} && //!isObjectHidden _unit} && // (currently dev branch only)
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
