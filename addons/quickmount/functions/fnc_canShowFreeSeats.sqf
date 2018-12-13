#include "script_component.hpp"
/*
 * Author: Dystopian
 * Checks if Free Seats menu can be shown.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can show menu <BOOL>
 *
 * Example:
 * [cursorObject, player] call ace_quickmount_fnc_canShowFreeSeats
 *
 * Public: No
 */

params ["_vehicle", "_unit"];

private _isInVehicle = _unit in _vehicle;

GVAR(enabled)
&& {
    GVAR(enableMenu) == 3
    || {_isInVehicle && {GVAR(enableMenu) == 2}}
    || {!_isInVehicle && {GVAR(enableMenu) == 1}}
}
&& {alive _vehicle}
&& {2 > locked _vehicle}
&& {
    -1 == crew _vehicle findIf {alive _x}
    || {0.6 <= side group _unit getFriend side group _vehicle}
}
&& {
    0.3 < vectorUp _vehicle select 2 // moveIn* and GetIn* don't work for flipped vehicles
    || {_vehicle isKindOf "Air"} // except Air
}
&& {!([] isEqualTo (_this call FUNC(addFreeSeatsActions)))} // this should be replaced with faster function
