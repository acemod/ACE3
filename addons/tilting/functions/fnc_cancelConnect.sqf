/*
 * Author: Jonpas
 * Cancels cable connection.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_tilting_fnc_cancelConnect
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

GVAR(placeAction) = PLACE_CANCEL;

[_unit, "forceWalk", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);
