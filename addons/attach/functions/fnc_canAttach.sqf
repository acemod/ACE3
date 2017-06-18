/*
 * Author: commy2
 * Check if a unit can attach a specific item.
 *
 * Arguments:
 * 0: vehicle that it will be attached to (player or vehicle) <OBJECT>
 * 1: unit doing the attach (player) <OBJECT>
 * 2: Array empty or containing a string of the attachable item <ARRAY>
 *
 * Return Value:
 * Can Attach <BOOL>
 *
 * Example:
 * [bob, bob, ["light"]] call ace_attach_fnc_canAttach;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_attachToVehicle","_player","_args"];
_args params [["_itemClassname","", [""]]];
TRACE_3("params",_attachToVehicle,_player,_itemClassname);

private ["_attachLimit", "_attachedObjects"];

_attachLimit = [6, 1] select (_player == _attachToVehicle);
_attachedObjects = _attachToVehicle getVariable [QGVAR(attached), []];

((_player == _attachToVehicle) || {canStand _player}) &&
{(_attachToVehicle distance _player) < 10} &&
{alive _attachToVehicle} &&
{(count _attachedObjects) < _attachLimit} &&
{_itemClassname in ((itemsWithMagazines _player) + [""])};
