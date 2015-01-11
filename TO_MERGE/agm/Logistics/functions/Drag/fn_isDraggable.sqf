/*
 	Name: AGM_Drag_fnc_isDraggable
 	
 	Author(s):
		L-H

 	Description:
		Checks if an object can be dragged
	
	Parameters:
		OBJECT - Drag-able object
 	
 	Returns:
		BOOLEAN
 	
 	Example:
		[StaticWeapon, player] call AGM_Drag_fnc_isDraggable;
*/
private ["_result", "_targetObject","_unit"];
_result = true;
_targetObject = _this select 0;
_unit = _this select 1;

if (_unit != (vehicle _unit)) exitWith {false};
if (_targetObject getVariable ["AGM_disableDrag", false]) exitWith {false};
//if (_targetObject getVariable ["AGM_inUse", false]) exitWith {false};

if ((typeOf _targetObject) isKindOf "StaticWeapon") then {
	_result = isNull(gunner _targetObject);
	if !(_result) then {
		_result = !alive (gunner _targetObject);
	};
};
if !(_result) exitWith {_result};
_result = !(_unit call AGM_Drag_fnc_isDraggingObject) AND ((_unit distance _targetObject) < 3);
_result && {!([_targetObject] call AGM_Core_fnc_owned)}
