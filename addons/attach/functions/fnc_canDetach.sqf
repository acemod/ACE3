#include "script_component.hpp"

/*
* Author: commy2
*
* Check if a unit has an item attached and if it can remove that item.
*
* Argument:
* 0: Unit that wants to detach something (Object)
*
* Return value:
* Boolean (Bool)
*/

private ["_attachedObjects", "_inRange", "_unitPos", "_objectPos"];

PARAMS_2(_unit,_attachToVehicle);

_attachedObjects = _attachToVehicle getVariable ["ACE_AttachedObjects", []];

_inRange = false;
if (_unit == _attachToVehicle) then {
  _inRange = (count _attachedObjects) > 0;
} else {
  //Scan if unit is within range (using 2d distance)
  _unitPos = getPos _unit;
  _unitPos set [2,0];
  {
    _objectPos = getPos _x;
    _objectPos set [2, 0];
    if ((_objectPos distance _unitPos) < 4) exitWith {_inRange = true};
  } forEach _attachedObjects;
};

(canStand _unit) && _inRange && {alive _attachToVehicle}
