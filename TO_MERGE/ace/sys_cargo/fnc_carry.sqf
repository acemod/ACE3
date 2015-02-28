/* ace_sys_cargo | (c) 2010,2011 by rocko */

#include "script_component.hpp"

#define CARRYOFFSET 0.5

private["_unit","_action","_box","_pos2","_dir","_modelPos","_params","_track"];

if (dialog) then { closeDialog 0; };

if (count _this < 2) then {
	_params = ["","","",["start", _this select 0]];
} else {
	_params = _this;
};

// TODO: Check other interactions, entering a car while carrying something, ladders, dying

//["","",_action,["stop",_box]] spawn FUNC(carry)

_unit = player;
_action = (_params select 3) select 0;
_box = (_params select 3) select 1; // TODO: should be (_this select 0)

switch _action do {
	case "start": {
		// Monitor Roadway LOD occlusion
		_track = true;
		
		if (_unit getVariable [QGVAR(carrying),false] || {_unit getVariable [QGVAR(dragging),false]}) exitWith {
			[localize "STR_ACE_CARGO_ERR_OCC",[1,0,0,1],true,0] spawn ace_fnc_visual;
		};
		if (_box getVariable [QGVAR(busy),false]) exitWith {
			[localize "STR_ACE_CARGO_ERR_OCC",[1,0,0,1],true,0] spawn ace_fnc_visual;
		};
		if ((_unit distance _box) <= 2.5) then {
			[objnull,_box,1,1] call FUNC(cbusy);
			detach _box;
			_safetyCarryOffset = _box getVariable [QGVAR(carryOffsetInc),0];
			_offset = 0.6 + _safetyCarryOffset;
			_box attachTo [_unit,[0,_offset,1]]; // Obs: Boxes that have a roadway lod, cause player flying into air. Need to make sure box clips into player to avoid this OR move box that far away so that roadway lod makes no contact with player (0.4 = clipping, 0.7 = outbound)
			_unit setVariable [QGVAR(carrying), true, false];
			_unit setVariable [QGVAR(carried_object),_box]; // TODO: Probably should be extended to all stuff we attachto player, so it becomes tracked
			_box setDir (_dir - (getDir _unit));
			_unit selectWeapon (primaryWeapon _unit);
			_unit switchMove "amovpercmstpslowwrfldnon"; //"amovpercmstpslowwrfldnon_player_idlesteady03";
			_weight = [_box] call FUNC(weight);
			[_unit,_weight] call INC_MASS; // TODO: Get Weight
			if (_weight > 13) then {
				_unit forceWalk true;			
			};
			// TODO: Move to config properties to automatically decide what to do with special items
			
			
			//Ruckcratechek
			if (_box isKindOf "ACE_Rucksack_crate") then {
				_box setVectorDirAndUp [[-0.0204803,-0.585819,0.810183],[0.00794978,-0.810423,-0.585792]];
				_track = false;
			};
			//Artyshell
			if (_box isKindOf "ACE_Arty_ShellHolder") then {
				_box setVariable ["ACE_ARTY_OWNER", _unit, true];
				_unit setVariable ["ACE_ARTY_CARRY_SHELL", _box, false];
				_box attachTo [_unit,[0.2,0.5,1.15]];
				_track = false;
			};
			
			#define ACE_TEXT_RED(Text) ("<t color='#FF0000'>" + ##Text + "</t>")
			
			// TODO: Use displayName of carriedObject if it has one....
			_carry_action = _unit addAction[ACE_TEXT_RED((localize "STR_ACE_CARGO_CARRYRELASE")),QPATHTO_F(fnc_carry),["stop",_box],-100,false,false,"","_target == player"];
			_unit setVariable [QGVAR(carrying_action_index),_carry_action];
			//GVAR(drag_keyDownEHId) = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call ace_sys_cargo_fnc_dragkeydown"]; // Add "C" key down eventhandler
			_fired_i = _unit addEventHandler ["fired", {(_this select 0) setVariable ["ace_sys_cargo_forcedrop",true]}];
			_getin_i = _unit addEventhandler ["getin",{(_this select 0) setVariable ["ace_sys_cargo_forcedrop",true];}];
			_unit setVariable [QGVAR(carryFEH),_fired_i];
			_unit setVariable [QGVAR(carryGIH),_getin_i];
			_unit setVariable [QGVAR(forcedrop),false];
			_box setVariable [QUOTE(GVARMAIN(attachedBy)), QUOTE(COMPONENT), true];
		};

		// Service Loop
		while { _unit getVariable QGVAR(carrying) } do {
			_bugflyHeight1 = ((getposasl _box) select 2); //diag_log format ["h1: %1",_bugflyHeight1];
			sleep 0.25;
			_bugflyHeight2 = ((getposasl _box) select 2); //diag_log format ["h2: %1",_bugflyHeight2];
			_animdrop = !(weaponLowered player); // ["aidlpercmstpsraswrfldnon_idlesteady04","aidlpercmstpsraswrfldnon_aiming01","aidlpercmstpsraswrfldnon_idlesteady02","aidlpercmstpsraswrfldnon_idlesteady03","aidlpercmstpsraswrfldnon_idlesteady01","aidlpercmstpsraswrfldnon_aiming02"];
			_standing = ((_unit call CBA_fnc_getUnitAnim) select 0) in ["stand"];
			_forcedrop = _unit getVariable [QGVAR(forcedrop),false];
			// DBG
			//player sidechat format ["%1 %2 %3",_animdrop,_standing,_forcedrop];
			if (!_standing || {_animdrop} || {_forcedrop}) then { ["","",0,["stop",_box]] spawn FUNC(carry) };
			_bugflyRate = (_bugflyHeight2 - _bugflyHeight1) * 4;
			//player globalchat format ["%1",_bugflyRate];
			if (_track && {speed _unit == 0} && {_bugflyRate > 10}) then {
				_curBoxOffset = _box getVariable [QGVAR(carryOffsetInc),0];
				_newBoxOffset = _curBoxOffset + 0.2;
				_box setVariable [QGVAR(carryOffsetInc),_newBoxOffset,true]; // Set new safety carrying offset to avoid further bugging
				player setposATL [(getposATL player select 0), (getposATL player select 1), 0];
				["","",0,["stop",_box]] spawn FUNC(carry);
			};
			sleep 0.25;
		};
	};
	case "stop": {
		if (local _unit) then { localize "STR_ACE_CARGO_DROPPED" call ace_fnc_visual; };
		_box = (_this select 3) select 1;
		
		_bldg = [_unit,0.1] call ACE_fnc_inBuilding;
		
		_unit setVariable [QGVAR(carried_pos_end), getPosATL _unit, false];

		
		_posZ = if (_bldg) then { ((_unit modelToWorld [0,0,0]) select 2) - 0.05 } else { (getPosATL _unit) select 2 };
		_pos_end = _unit getVariable [QGVAR(carried_pos_end),(getPosATL _unit)];
		_pos_end set [0,(_pos_end select 0)+(sin (direction _unit) * 1.4)];
		_pos_end set [1,(_pos_end select 1)+(cos (direction _unit) * 1.4)];
		_pos_end set [2,_posZ];
		
		detach _box;
		_box setPosATL _pos_end;
		
		_unit setVariable [QGVAR(carried_pos_end), nil, false];
		_unit removeaction (_unit getVariable QGVAR(carrying_action_index));
		_unit setVariable [QGVAR(carrying), false, false];
		
		[objnull,_box,0,0] call FUNC(cbusy);
		
		// Ruckcratecheck
		if (_box isKindOf "ACE_Rucksack_crate") then {
			_box setVectorDirAndUp [[-0.0204803,-0.585819,0.810183],[0.00794978,-0.810423,-0.585792]];
		};
		//Artyshell
		if (_box isKindOf "ACE_Arty_ShellHolder") then {
			_box setVariable ["ACE_ARTY_OWNER", nil, true];
			_unit setVariable ["ACE_ARTY_CARRY_SHELL", nil, false];			
		};
		
		_unit forceWalk false;
		_weight = [_box] call FUNC(weight);
		[_unit,0] call INC_MASS; // TODO: Get Weight
		// Remove "C" key down eventhandler
		//(findDisplay 46) displayRemoveEventHandler ["KeyDown", GVAR(drag_keyDownEHId)];
		_unit removeEventhandler ["fired",(_unit getVariable QGVAR(carryFEH))];
		_unit removeEventhandler ["getin",(_unit getVariable QGVAR(carryGIH))];
		_unit setVariable [QGVAR(carryFEH),-1];
		_unit setVariable [QGVAR(carryGIH),-1];
		_unit setVariable [QGVAR(forcedrop),false];
		_box setVariable [QUOTE(GVARMAIN(attachedBy)), "", true];
	};
};

false
