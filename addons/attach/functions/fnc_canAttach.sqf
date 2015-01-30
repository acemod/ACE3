#include "script_component.hpp"

/*
 * Author: commy2
 *
 * Check if a unit can attach a specific item.
 * 
 * Argument:
 * 0: Unit that wants to attach the object (Object)
 * 1: Name of the attachable item (String)
 * 
 * Return value:
 * Boolean (Bool)
 */

PARAMS_3(_unit,_attachToVehicle,_item);

_attachLimit = if (_unit == _attachToVehicle) then {1} else {10};
_attachedObjects = _attachToVehicle getVariable ["ACE_AttachedObjects", []];

canStand _unit && {alive _attachToVehicle} && {(count _attachedObjects) < _attachLimit} && {_item in (magazines _unit + items _unit + [""])}
