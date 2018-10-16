#include "script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Cancels explosives placement.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Key <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, 1] call ace_explosives_fnc_cancelPlacement
 *
 * Public: No
 */

params ["_unit", "_key"];

if (_key != 1 || {!GVAR(pfeh_running)}) exitWith {};

GVAR(placeAction) = PLACE_CANCEL;
