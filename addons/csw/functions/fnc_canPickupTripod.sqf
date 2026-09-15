#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Checks if the player can pickup the tripod.
 *
 * Arguments:
 * 0: Tripod <OBJECT>
 *
 * Return Value:
 * Can pickup <BOOL>
 *
 * Example:
 * cursorObject call ace_csw_fnc_canPickupTripod
 *
 * Public: No
 */

params ["_tripod"];

alive _tripod && {((crew _tripod) findIf {alive _x && {!unitIsUAV _x}}) == -1} // return
