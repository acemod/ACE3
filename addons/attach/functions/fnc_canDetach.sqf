/*
 * Author: commy2
 * Check if a unit has an item attached and if it can remove that item.
 *
 * Arguments:
 * 0: unit doing the detaching (player) <STRING>
 * 1: vehicle that it will be detached from (player or vehicle) <OBJECT>
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

private ["_attachedObjects", "_inRange"];

_attachedObjects = _attachToVehicle getVariable [QGVAR(Objects), []];

_inRange = false;
if (_unit == _attachToVehicle) then {
    _inRange = count _attachedObjects > 0;
} else {
    //Scan if unit is within range (using 2d distance)
    private ["_unitPos", "_objectPos"];
    _unitPos = getPos _unit;
    _unitPos set [2,0];
    {
        _objectPos = getPos _x;
        _objectPos set [2, 0];
        if (_objectPos distance _unitPos < 4) exitWith {_inRange = true};
    } forEach _attachedObjects;
};

canStand _unit && {_inRange} && {alive _attachToVehicle}
