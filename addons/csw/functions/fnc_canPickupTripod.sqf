#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Checks if the unit can pickup the tripod
 *
 * Arguments:
 * 0: Tripod <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can pickup <BOOL>
 *
 * Example:
 * [cursorObject, player] call ace_csw_fnc_canPickupTripod
 *
 * Public: No
 */

params ["_tripod", "_unit"];

((secondaryWeapon _unit) == "") && {alive _tripod} // return
