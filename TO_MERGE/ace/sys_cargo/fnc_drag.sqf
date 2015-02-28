/* ace_sys_cargo | (c) 2010,2011 by rocko */

#include "script_component.hpp"

private["_unit","_action","_box","_pos2","_dir","_modelPos","_drag_action","_params","_modelPosZ"];

if (dialog) then { closeDialog 0; };

if (count _this < 2) then {
	_params = ["","","",["start", _this select 0]];
} else {
	_params = _this;
};

_unit = player;
_action = (_params select 3) select 0;
_box = (_params select 3) select 1; // TODO: should be (_this select 0)
switch _action do {
	case "start": {
		if ({alive _x} count (crew _box) > 0) exitWith {};
		//if (_box call CBA_fnc_locked) exitWith {};
		if ((_unit distance _box) > 2.5) exitWith { [localize "STR_ACE_CARGO_ERR_NOWEP",[1,0,0,1],true,0] spawn ace_fnc_visual; };
		if (_unit getVariable [QGVAR(carrying),false] || {_unit getVariable [QGVAR(dragging),false]}) exitWith {
			[localize "STR_ACE_CARGO_ERR_OCC",[1,0,0,1],true,0] spawn ace_fnc_visual;
		};		
		if (_box getVariable [QGVAR(busy),false]) exitWith {
			[localize "STR_ACE_CARGO_ERR_OCC",[1,0,0,1],true,0] spawn ace_fnc_visual;
		};
		if ((_unit distance _box) <= 2.5) then {
			[objnull,_box,1,1] call FUNC(cbusy);
			detach _box;
			_unit playActionNow "grabDrag";
			_pos2 = getPosATL _box;
			_dir = getDir _box;
			_modelPos = _unit worldToModel _pos2; //is ATL format
			if (_box isKindOf "StaticWeapon") then {
				if (typeOf _box in ["ACE_M252","ACE_M224_1","ACE_2b14_82mm","ACE_120Tampella_Baseplate","ACE_120Tampella_Barrel"]) then { _modelPosZ = 0; } else { _modelPosZ = 0.8; };
			} else { _modelPosZ = 0; };
			
			
			
			//_modelPosZ = if (typeOf _box in ["ACE_M252","ACE_M224_1","ACE_2b14_82mm"]) then { 0 }; // Argh!!1: TODO: Fix ACE mortar axis
			_box attachTo [_unit,[_modelPos select 0,_modelPos select 1,_modelPosZ],""];
			_unit setVariable [QGVAR(dragging), true, false];
			_unit setVariable [QGVAR(dragged_object),_box]; // TODO: Probably should be extended to all stuff we attachto player, so it becomes tracked
			_box setDir (_dir - (getDir _unit));
			//Ruckcratechek
			if (_box isKindOf "ACE_Rucksack_crate") then {
				_box setVectorDirAndUp [[-0.0204803,-0.585819,0.810183],[0.00794978,-0.810423,-0.585792]];
			};
			_box lock true;
			#define ACE_TEXT_RED(Text) ("<t color='#FF0000'>" + ##Text + "</t>")
			_drag_action = _unit addAction [ACE_TEXT_RED((localize "STR_ACE_CARGO_RELASE")),QPATHTO_F(fnc_drag),["stop",_box],-100,false,false,"","_target == player"];
			GVAR(drag_keyDownEHId) = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call ace_sys_cargo_fnc_dragkeydown"]; // Add "C" key down eventhandler
		};

		waitUntil { animationState _unit == "ACINPKNLMSTPSRASWRFLDNON" };

		
		_weight = ([_box] call FUNC(weight)) * sin 45;
		[_unit,_weight] call INC_MASS;		
		
		while { alive _unit && {_unit getVariable QGVAR(dragging)} } do {
			sleep 0.5;

			if !(animationState _unit in ["acinpknlmstpsraswrfldnon","acinpknlmwlksraswrfldb"]) exitWith {
				_unit setVariable [QGVAR(dragging), false, false];
				_unit setVariable [QGVAR(dragged_object),objNull];
				_unit switchMove "ACINPKNLMSTPSRASWRFLDNON";
				["","",_drag_action,["stop",_box]] spawn FUNC(drag);
			};
		};
	};
	case "stop": {
		// Remove "C" key down eventhandler
		(findDisplay 46) displayRemoveEventHandler ["KeyDown", GVAR(drag_keyDownEHId)];
		
		// Dragging in building??
		_bldg = [_unit,0.1] call ACE_fnc_inBuilding;

		_box = (_this select 3) select 1;
		_unit setVariable [QGVAR(dragged_pos_end), getPosATL _box, false];
		_box lock false;
		_unit playAction "released";
		detach _box;
		_posZ = if (_bldg) then { ((_unit modelToWorld [0,0,0]) select 2) - 0.05 } else { (getPosATL _unit) select 2 };
		_pos_end = _unit getVariable QGVAR(dragged_pos_end);
		_box setPosATL [_pos_end select 0, _pos_end select 1, _posZ];
		_unit setVariable [QGVAR(dragged_pos_end), nil, false];
		_unit removeaction (_this select 2);
		_unit setVariable [QGVAR(dragging), false, false];
		[objnull,_box,0,0] call FUNC(cbusy);
		
		// Ruckcratecheck
		if (_box isKindOf "ACE_Rucksack_crate") then {
			_box setVectorDirAndUp [[-0.0204803,-0.585819,0.810183],[0.00794978,-0.810423,-0.585792]];
		};
		if (_box isKindOf "StaticWeapon") then {
			//_box setVariable ["ace_sys_crewserved_pitch",0,true];
			[_box] call ace_sys_crewserved_fnc_setPitch_stored;  // Screwsup
		};
		[_unit,0] call INC_MASS;
	};
};

false
