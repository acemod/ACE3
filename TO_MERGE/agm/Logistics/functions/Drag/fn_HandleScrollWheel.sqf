/*
 	Name: AGM_Drag_fnc_HandleScrollWheel
 	
 	Author(s):
		L-H

 	Description:
		Handles raising and lowering the dragged weapon to be able to place it on top of objects.
	
	Parameters:
		Number: Scroll amount
 	
 	Returns:
		Boolean: Handled or not.
 	
 	Example:
		1.2 call AGM_Drag_fnc_HandleScrollWheel;
*/
#define CLAMP(x,low,high) (if(x > high)then{high}else{if(x < low)then{low}else{x}})

private ["_handled", "_z", "_draggedObject"];
_handled = false;
if (player call AGM_Drag_fnc_isDraggingObject) then {
	if (AGM_Modifier > 0) then {
		_z = (_this * 0.15);
		AGM_Drag_CurrentHeightChange = CLAMP(AGM_Drag_CurrentHeightChange + _z,0,1.755);
		if (AGM_Drag_CurrentHeightChange <= 1.75 AND {AGM_Drag_CurrentHeightChange >= 0}) then {
			_handled = true;
			_draggedObject = player getVariable ["AGM_carriedItem", objNull];
			if (isNull _draggedObject) exitWith {};
			
			private ["_pos", "_max"];
			_pos = getPosATL _draggedObject;
			_max = (player ModelToWorld [0,0,1.5]) select 2;
			_z = (_pos select 2) + _z;
			_pos set [2, CLAMP(_z,0,_max)];
			
			detach _draggedObject;
			_draggedObject setPosATL _pos;
			_draggedObject attachTo [player];
		};
	};
};

_handled
