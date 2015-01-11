/*
 	Name: AGM_Drag_fnc_makeUndraggable
 	
 	Author(s):
		L-H

 	Description:
		Makes an object undraggable. Also reverses the effects of a AGM_Drag_fnc_makeDraggable call.
	
	Parameters:
		0: OBJECT - Object (static weapon, crate, etc.)
 	
 	Returns:
		Nothing
 	
 	Example:
		// Remove drag functionality from an object
		[StaticWeapon2] call AGM_Drag_fnc_makeUndraggable;
*/
private ["_object", "_id"];
_object = (_this select 0);

if (_object getVariable ["AGM_inUse", false]) then {
	private "_parentObject";
	_parentObject = attachedTo _object;
	if (!isNull _parentObject AND {_parentObject call AGM_Drag_fnc_isDraggingObject}) then {
		_parentObject call AGM_Drag_fnc_releaseObject;
	} else {
		_object setVariable ["AGM_isUsedBy", objNull, true];
	};
};
_object setVariable ["AGM_disableDrag", true, true];

_id = _object getVariable "AGM_dragActionID";
if (!(isNil "_id") OR {_id != -1}) then {
	_object setVariable ["AGM_dragActionID", -1, true];
	[_object, _id] call AGM_Interaction_fnc_removeInteraction;
};
