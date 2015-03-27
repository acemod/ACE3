/*
 * Author: commy2
 * Check if a unit can attach a specific item.
 *
 * Arguments:
 * 0: unit doing the attach (player) <OBJECT>
 * 1: vehicle that it will be attached to (player or vehicle) <OBJECT>
 * 2: Name of the attachable item <STRING><OPTIONAL>
 *
 * Return Value:
 * Boolean <BOOL>
 *
 * Example:
 * Nothing
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_unit,_attachToVehicle);
DEFAULT_PARAM(2,_item,"");

private ["_attachLimit", "_attachedObjects"];

_attachLimit = [10, 1] select (_unit == _attachToVehicle);
_attachedObjects = _attachToVehicle getVariable [QGVAR(Objects), []];

canStand _unit && {alive _attachToVehicle} && {count _attachedObjects < _attachLimit} && {_item in (itemsWithMagazines _unit + [""])}
