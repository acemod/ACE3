#include "script_component.hpp"
/*
 * Author: Rocko
 * Handles wire Init
 *
 * Arguments:
 * 0: wire <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [wire] call ace_concertina_wire_fnc_handleInit
 *
 * Public: No
 */
params ["_wire"];
_wire addEventHandler ["HandleDamage", {call FUNC(handleDamage)}];
