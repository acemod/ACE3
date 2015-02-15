/* ace_sys_cargo | (c) 2010,2011 by rocko */

//#define DEBUG_MODE_FULL
#include "script_component.hpp"

PARAMS_2(_vehicle,_location);

private ["_disp", "_ctrl", "_index", "_currentcontent", "_vehicle", "_cargo", "_newcontent", "_hasPlaceholder", "_placeholder", "_pos","_ui","_dir"];

_ui = if (_location == "back") then {"ACE_Cargo_List"} else {"ACE_CargoFront_List"};
_disp = uiNamespace getVariable _ui;
_ctrl = _disp displayCtrl 99;

_index = lbCurSel _ctrl;
if (_index < 0) exitWith { if (dialog) then { closeDialog 0; }; };
if (dialog) then {closeDialog 0};

// Remove cargo item
_currentcontent = if (_location == "back") then { _vehicle getVariable [QGVAR(content), []] } else { _vehicle getVariable [QGVAR(content_front), []] };
if (isNil "_currentcontent") exitWith {};
_cargo = _currentcontent select _index; TRACE_1("Unloading _cargo",_cargo);
if (_cargo in _currentcontent) then {
	_newcontent = _currentcontent - [_cargo];
	if (_location == "back") then {
		TRACE_1("Unloading cargo from trunk","");
		_vehicle setVariable [QGVAR(content), _newcontent, true]; // Add cargo variables
	} else {
		TRACE_1("Unloading cargo from front","");
		_vehicle setVariable [QGVAR(content_front), _newcontent, true]; // Add cargo variables
		[_cargo] call FUNC(detachFront);
	};
	if (count _newcontent < 1) then {
		_hasPlaceholder = _vehicle getVariable [QGVAR(hasPlaceholder), false];
		if (_hasPlaceholder) then {
			_vehicle setVariable [QGVAR(hasPlaceholder), false, true]; // Reset placeholder variable
			_placeholder = _vehicle getVariable QGVAR(POB);
			detach _placeholder;
			deleteVehicle _placeholder;
		};
	};
	_at_player = _cargo getVariable [QGVAR(atplayer),false];
	_distance = if (_at_player) then { 1.5 } else { _cargo getVariable [QGVAR(Distance),4]; };	
	if (_location == "back") then {
		_dir = if (_at_player) then { getDir player + 180 } else { getDir _vehicle - 180 + (random 20) - (random 20); };
	} else {
		_dir = if (_at_player) then { getDir player + 180 } else { getDir _vehicle + (random 20) - (random 20); };
	};
	_posV = if (_at_player) then { getPosATL player; } else { getPosATL _vehicle; };
	_unloadPos = [(_posV select 0) + ((sin _dir) * _distance), (_posV select 1) + ((cos _dir) * _distance),_posV select 2];	

	// TODO: Move to config properties to automatically decide what to do with special items
	// Ruckcrate check
	if (_cargo isKindOf "ACE_Rucksack_crate") then {
		_cargo setVectorDirAndUp [[-0.0204803,-0.585819,0.810183],[0.00794978,-0.810423,-0.585792]];
		_cargo_owner = _cargo getVariable "ACE_SYS_CARGO_OWNER";
		if (_cargo_owner == name player) then {
			_backpack = toArray(typeOf _cargo);
			for "_x" from ((count _backpack) - 6) to ((count _backpack) - 1) do {
				_backpack set [_x, nil];
			};
			_backpack = toString(_backpack);
			[_cargo,player,nil,_backpack] execVM "\z\ace\addons\sys_ruck\act_TakeRuck.sqf";
		};
	};
	
	if (_cargo isKindOf "StaticWeapon") then {
		_cargo setVariable ["ace_sys_crewserved_pitch",0,true];
	};
	
	if ([_cargo,""] call FUNC(determineCargo) == 1) then {
		if !(player getVariable [QGVAR(carrying),false]) then {
			[_cargo] spawn FUNC(carry);
		};
	};
	if (surfaceIsWater _unloadPos) then {
		_unloadPos set [2, (getPosASL player select 2)];
		_cargo setposASL _unloadPos;
	} else {
		_cargo setpos _unloadPos;
	};	
	
	player reveal _cargo;
};

[_vehicle,objnull,0,0] call FUNC(cbusy);
