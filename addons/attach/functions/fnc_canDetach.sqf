/*
 * Author: commy2
 * Check if a unit has an item attached and if it can remove that item.
 *
 * Arguments:
 * 0: vehicle that it will be detached from (player or vehicle) <OBJECT>
 * 1: unit doing the detaching (player) <OBJECT>
 *
 * Return Value:
 * Can Detach <BOOL>
 *
 * Example:
 * [bob, bob] call ace_attach_fnc_canDetach;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_attachToVehicle", "_unit"];
TRACE_2("params",_attachToVehicle,_unit);

private ["_inRange"];

_inRange = false;
{
    _x params ["_xObject"];
    if (((getPos _unit) distance2d (getPos _xObject)) < 4) exitWith {_inRange = true};
} forEach (_attachToVehicle getVariable [QGVAR(attached), []]);

_inRange &&
{(_unit == _attachToVehicle) || {canStand _unit}} &&
{alive _attachToVehicle}
