/* ace_sys_cargo | (c) 2010,2011 by rocko */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

private["_unit","_action","_box","_pos2","_dir","_modelPos","_drag_action","_params","_process"];

if (dialog) then { closeDialog 0; };

PARAMS_2(_cargo,_vehicle);

private "_dragnet";
// Fix, when a player is dragging an object dragging doesn't stop,
_dragnet = player getVariable [QGVAR(dragging), false];
if (_dragnet) exitWith {
	(localize "STR_ACE_DRAGQUEENSTOP") spawn ace_fnc_visual;
};
// Box is in process?
if (_cargo getVariable [QGVAR(busy),false]) exitWith {
	[localize "STR_ACE_CARGO_ERR_OCC",[1,0,0,1],true,0] spawn ace_fnc_visual;
};

// Mexican hidden in a box?
if ({alive _x} count (crew _cargo) > 0) exitWith { (localize "STR_ACE_CARGO_ERR_MEXICO") spawn ace_fnc_visual; };

// Store each cargo element loaded into vehicle
_currentcontent = _vehicle getVariable [QGVAR(content), []];
TRACE_1("Current content",_currentcontent);

// Weight managment
// Max capacity and weight limits for the vehicle
_volume_vehicle = [_vehicle] call FUNC(volume);
_size_vehicle = sizeOf (typeOf _vehicle);
_weight_vehicle = floor (_volume_vehicle * _size_vehicle * 4);
_weight_vehicle_maxload = floor (_weight_vehicle / 5);
_weight_vehicle_current = 0;
if (count _currentcontent > 0) then {
	{
		private ["_w"];
		_w = [_x, 0] call FUNC(weight);
		_weight_vehicle_current = _weight_vehicle_current + _w;
	} foreach _currentcontent;
};
TRACE_5("V S W Wmax Wcur",_volume_vehicle, _size_vehicle, _weight_vehicle, _weight_vehicle_maxload, _weight_vehicle_current);

// Max capacity and weight limits for the cargo
_volume_cargo = [_cargo] call FUNC(volume);
_weight_cargo = [_cargo,0] call FUNC(weight);
TRACE_1("",_weight_cargo);

_loading_allowed = ((_weight_vehicle_maxload - _weight_vehicle_current) >= _weight_cargo);

TRACE_1("",_loading_allowed);
if !(_loading_allowed) exitWith { (localize "STR_ACE_CARGO_ERR_HEAVY") spawn ace_fnc_visual; };

//set busy state for vehicle
[_vehicle,_cargo,1,1] call FUNC(cbusy);

if (local player) then {
	#ifndef DEBUG_MODE_FULL
		#define __DELAY ((50/145) * _weight_cargo) // 50 seconds to load a 145kg heavy object alone
		_potHelper = (position player) nearEntities ["CaManBase",5] - [player];
		if (player in _potHelper) then { _potHelper = _potHelper - [player] };
		_time = if (count _potHelper > 0) then { __DELAY / 2 } else { __DELAY };	
		
		player setVariable ["ACE_PB_Result", 0];
		[_time,[localize "STR_ACE_CARGO_LOADING"],true,true] spawn ace_progressbar;
		waitUntil { (player getVariable "ACE_PB_Result" != 0) };
		_process = (player getVariable "ACE_PB_Result" == 1);
		player setVariable ["ACE_PB_Result", 0];
	#endif
	#ifdef DEBUG_MODE_FULL
		_process = true;
	#endif
};
if (!_process) exitWith {
	// Reset busy state for vehicle
	[_vehicle,_cargo,0,0] call FUNC(cbusy);
};

// Load
_newcontent = _currentcontent;
_newcontent set [count _newcontent,_cargo];
TRACE_1("New content", _newcontent);

_vehicle setVariable [QGVAR(content), _newcontent, true]; // Add cargo variables

// Store loading position = unloading cargo will make the cargo appear at the same spot where it was when a player loaded it
// Relative to transporter
_cargo setVariable [QGVAR(Distance), (_cargo distance _vehicle), true];

// Hide _cargo
// Avoid cargo setPosing in water and accidentally killing it
_cargo_pos = getPosATL _cargo;
#ifndef DEBUG_MODE_FULL // TEST MODE TO CHECK WETHER LOADED OBJECTS ARE DELETED
	detach _cargo;
	//_cargo setPos [_cargo_pos select 0, _cargo_pos select 1, (_cargo_pos select 2) - 20];
	// Put stuff to [0,0,0] no matter what
	_cargo setPos [0,0,0];
#endif

// SetVariable
[_cargo,"set"] call FUNC(determineCargo); // Using "set", so data is only stored over net if object is loaded only
	
// Reset busy state for vehicle
[_vehicle,_cargo,0,0] call FUNC(cbusy);
