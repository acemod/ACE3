/*
 	Name: AGM_Drag_fnc_releaseObject
 	
 	Author(s):
		L-H

 	Description:
		Releases dragged weapon from passed unit.
	
	Parameters:
		OBJECT - Unit
 	
 	Returns:
		Nothing
 	
 	Example:
		player call AGM_Drag_fnc_releaseObject;
*/
private ["_draggedObject", "_position"];
_this removeWeapon "AGM_FakePrimaryWeapon";
_draggedObject = _this getVariable ["AGM_carriedItem", objNull];
if (_this == (vehicle _this)) then { // if the unit is the vehicle of the passed unit (avoids bugs with players entering vehicles while dragging
	_this playAction "released";
};
if (isNull _draggedObject) exitWith {};  // If there is no dragged object exit now.

[objNull, _draggedObject, true] call AGM_Core_fnc_claim;

_this setVariable ["AGM_isDragging", false];
_this setVariable ["AGM_carriedItem", objNull, true];

detach _draggedObject;
[_this, "AGM_Logistics", false] call AGM_Core_fnc_setForceWalkStatus;
_this removeAction (_this getVariable ["AGM_Drag_ReleaseActionID", -1]);
_draggedObject setDamage (damage _draggedObject);

_position = getPosATL _draggedObject;
if (_position select 2 < 0) then {
	_position set [2, 0];
	_draggedObject setPosATL _position;
};
[_draggedObject, "{_this setVectorUp (surfaceNormal getPosASL _this)}", _draggedObject] call AGM_Core_fnc_execRemoteFnc;
