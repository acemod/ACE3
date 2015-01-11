/*
 	Name: AGM_Drag_fnc_dragObject
 	
 	Author(s):
		L-H

 	Description:
		Prepares the passed unit to drag the passed weapon.
	
	Parameters:
		0: OBJECT - Dragged weapon
		1: OBJECT - Unit dragging
 	
 	Returns:
		Nothing
 	
 	Example:
		[StaticWeapon3, player] call AGM_Drag_fnc_dragObject;
*/

#define ANIM_CARRY ["amovpercmstpslowwrfldnon_acinpknlmwlkslowwrfldb_2", "amovpercmstpsraswpstdnon_acinpknlmwlksnonwpstdb_2", "amovpercmstpsnonwnondnon_acinpknlmwlksnonwnondb_2", "acinpknlmstpsraswrfldnon", "acinpknlmstpsnonwpstdnon", "acinpknlmstpsnonwnondnon"];

_this spawn {
	_draggedObject = _this select 0;
	_unit = _this select 1;
	if (_draggedObject getVariable ["AGM_disableDrag", false]) exitWith {};
	_ableToDrag = true;

	if ((typeOf _draggedObject) isKindOf "StaticWeapon") then {
		_gunner = gunner _draggedObject;
		if (!isNull _gunner && {alive _gunner}) then {
			_gunner setPosASL getPosASL _gunner;
		};
	} else { // Crate handling
		if (_draggedObject getVariable ["AGM_useWeight", true]) then {
			_ableToDrag = ((_draggedObject call AGM_Drag_fnc_GetWeight) <= AGM_Drag_MaxWeight);
		};
	};
	if (!_ableToDrag) exitWith { [localize "STR_AGM_Drag_UnableToDrag"] call AGM_Core_fnc_displayTextStructured;};
	if (primaryWeapon _unit == "") then {
		_unit addWeapon "AGM_FakePrimaryWeapon";
	};
	_unit selectWeapon (primaryWeapon _unit);

	[_unit, _draggedObject, true] call AGM_Core_fnc_claim;

	_unit setVariable ["AGM_isDragging", true];
	_unit setVariable ["AGM_carriedItem", _draggedObject, true];

	_unit playActionNow "grabDrag";
	waitUntil {animationState _unit in ANIM_CARRY};

	// exit here if the player releases the jerry can before the animation is finished
	if !(_unit getVariable ["AGM_isDragging", false]) exitWith {
		_unit playAction "released";
	};

	_attachPoint = [0,1.2, ((_draggedObject modelToWorld [0,0,0]) select 2) - ((_unit modelToWorld [0,0,0]) select 2)];
	_draggedObject attachTo [_unit, _attachPoint];

	_actionID = _unit getVariable ["AGM_Drag_ReleaseActionID", -1];

	if (_actionID != -1) then {
		_unit removeAction _actionID;
	};
	_actionID = _unit addAction [format ["<t color='#FF0000'>%1</t>", localize "STR_AGM_Drag_EndDrag"], "player call AGM_Drag_fnc_releaseObject;", nil, 20, false, true, "","player call AGM_Drag_fnc_isDraggingObject"];

	_unit setVariable ["AGM_Drag_ReleaseActionID", _actionID];

	AGM_Drag_CurrentHeightChange = 0;
};
