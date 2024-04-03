#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Checks if the unit can pickup the tripod
 *
 * Arguments:
 * 0: Tripod <OBJECT>
 * 1: Unit <OBJECT> (unused)
 *
 * Return Value:
 * Can pickup <BOOL>
 *
 * Example:
 * [cursorObject, player] call ace_csw_fnc_assemble_canPickupTripod
 *
 * Public: No
 */

params ["_tripod"];

alive _tripod // return
