/*
 	Name: AGM_Drag_fnc_makeDraggable
 	
 	Author(s):
		L-H

 	Description:
		Initialises an object for drag usage.
		Ensure it is only run on one client or the server.
	
	Parameters:
		0: OBJECT - Object (static weapon, crate, etc.)
		1: BOOLEAN - Weight accounting if a crate (Default: true)
 	
 	Returns:
		Nothing
 	
 	Example:
		// simply make an object draggable
		StaticWeapon2 call AGM_Drag_fnc_makeDraggable;
		// make a weapon crate draggable while ignoring its weight
		[WeaponCrate,false] call AGM_Drag_fnc_makeDraggable;
		
		// Ensuring only the server initialises the object in the init for the object
		if (isServer) then {
			this call AGM_Drag_fnc_makeDraggable;
		};
*/
private ["_nilTest", "_weightAccount", "_object", "_id"];
if ((typeName _this) == "ARRAY") then {
	_object = (_this select 0);
	if (count _this > 1) then {
		_weightAccount = (_this select 1);
	};
} else {
	_object = _this;
	_weightAccount = true;
};
_nilTest = _object getVariable "AGM_dragActionID";
if ((isNil "_nilTest") OR {_id == -1}) then {
	_object setVariable ["AGM_isUsedBy", objNull, true];
	_object setVariable ["AGM_useWeight", _weightAccount, true];
	_object setVariable ["AGM_disableDrag", false, true];
	_id = [_object, localize "STR_AGM_Drag_StartDrag", 4, {!(player call AGM_Drag_fnc_isDraggingObject) AND {[AGM_Interaction_Target, player] call AGM_Drag_fnc_isDraggable}}, {[AGM_Interaction_Target, player] call AGM_Drag_fnc_dragObject;}, true, 2.2] call AGM_Interaction_fnc_addInteraction;
	_object setVariable ["AGM_dragActionID", _id, true];
	_id = _object getVariable ["AGM_releaseActionID", -1];
	if (_id == -1) then {
		_id = [_object, localize "STR_AGM_Drag_EndDrag", 4, {(player call AGM_Drag_fnc_isDraggingObject)}, {player call AGM_Drag_fnc_releaseObject;}, false, 2.1] call AGM_Interaction_fnc_addInteraction;
		_object setVariable ["AGM_releaseActionID", _id, true];
	};
};
