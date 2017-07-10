/*
 * Author: chris579
 * Inits the object with the rating eventhandler
 *
 * Arguments:
 * 0: The man object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ace_rating_fnc_initManLocal
 *
 * Public: No
 */

#include "script_component.hpp"

params["_unit"];
TRACE_1("params",_unit);

// Don't add if unit is not local
if(!local _unit) exitWith {};

// Check settings
if((isPlayer _unit && GVAR(allowNegativeRatingPlayers)) || (!(isPlayer _unit) && GVAR(allowNegativeRatingAi))) exitWith {};

TRACE_1("adding rating eh",_unit);

_unit addEventHandler ["HandleRating", {0}];
