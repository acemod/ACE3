/*
 * Author: Dystopian
 * Checks if Free Seats menu can be shown.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Able to show menu <BOOL>
 *
 * Example:
 * [cursorObject, player] call ace_quickmount_fnc_canShowFreeSeats
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle", "_unit"];

(GVAR(enabled) && {GVAR(enableGetInMenu)} || {!isNull objectParent _unit})
&& {alive _vehicle}
&& {2 > locked _vehicle}
&& {
    0 == {alive _x} count crew _vehicle
    || {0.6 <= side group _unit getFriend side group _vehicle}
}
