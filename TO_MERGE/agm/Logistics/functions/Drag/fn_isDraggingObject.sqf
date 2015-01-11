/*
 	Name: AGM_Drag_fnc_isDraggingObject
 	
 	Author(s):
		L-H

 	Description:
		Checks whether there is an attached dragged object to the passed unit.
	
	Parameters:
		OBJECT: Unit
 	
 	Returns:
		BOOLEAN: true if a dragged object is attached.
 	
 	Example:
		_draggingObject = player call AGM_Drag_fnc_isDraggingObject;
*/
private "_draggedObject";
_draggedObject = _this getVariable ["AGM_carriedItem", objNull];
if (isNull _draggedObject) exitWith {false};

true
