/*
 * Author: commy2
 * Check if a unit can attach a specific item.
 *
 * Arguments:
 * 0: unit doing the attach (player) <OBJECT>
 * 1: vehicle that it will be attached to (player or vehicle) <OBJECT>
 * 2: Name of the attachable item <STRING>
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

PARAMS_3(_unit,_attachToVehicle,_item);

_attachLimit = if (_unit == _attachToVehicle) then {1} else {10};
_attachedObjects = _attachToVehicle getVariable ["ACE_AttachedObjects", []];

canStand _unit && {alive _attachToVehicle} && {(count _attachedObjects) < _attachLimit} && {_item in ((magazines _unit) + (items _unit) + [""])}
