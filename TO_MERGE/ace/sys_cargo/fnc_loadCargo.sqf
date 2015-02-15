/*
Function: ACE_fnc_loadCargo

Description:
	Load cargo into vehicles.

Parameters:
	_cargo - Cargo object to load. (Must exist) [Array of one or more objects]
	_vehicle - Vehicle to load cargo into. (Must exist) [Object]
Returns:
	nothing

Example:
	(begin example)
		[[myCrate1, myCrate2], myTruck] call ACE_fnc_loadCargo;
	(end)

Author:
	rocko
*/

#include "script_component.hpp"

PARAMS_2(_cargo,_vehicle);

private "_error";
{
	_preloading_allowed = true;
	if (isNull _x) then { _error = format["Cargo (%1) does not exist",_x]; _preloading_allowed = false; TRACE_1("Cargo isNull",""); };
	if (isNil "_x") then { _error = format["Cargo (%1) does not exist",_x]; _preloading_allowed = false; TRACE_1("Cargo isNil",""); };
	if (isNull _vehicle) then { _error = format["Vehicle (%1) does not exist",_vehicle]; _preloading_allowed = false; TRACE_1("Vehicle isNull",""); };
	if (_x getVariable [QGVAR(busy),false]) then { _error = format["Cargo (%1) is busy",_x]; _preloading_allowed = false; TRACE_1("Cargo is busy",""); };
	if ({alive _x} count (crew _x) > 0) then { _error = format["Cargo (%1) has crew",_x]; _preloading_allowed = false; TRACE_1("Cargo is occupied",""); };

	TRACE_1("Current cargo processed",_x);
	_currentcontent = _vehicle getVariable [QGVAR(content), []]; TRACE_1("Current content",_currentcontent);
	_volume_vehicle = [_vehicle] call FUNC(volume);
	_size_vehicle = sizeOf (typeOf _vehicle);
	_weight_vehicle = floor (_volume_vehicle * _size_vehicle * 4);
	_weight_vehicle_maxload = floor (_weight_vehicle / 5);
	_weight_vehicle_current = 0;
	if (count _currentcontent > 0) then {
		{
			private ["_w"];
			_w = [_x] call FUNC(weight);
			_weight_vehicle_current = _weight_vehicle_current + _w;
		} foreach _currentcontent;
	};
	TRACE_5("VSWWmaxWcur",_volume_vehicle, _size_vehicle, _weight_vehicle, _weight_vehicle_maxload, _weight_vehicle_current);

	_volume_cargo = [_x] call FUNC(volume); TRACE_1("",_volume_cargo);
	_weight_cargo = [_x] call FUNC(weight); TRACE_1("",_weight_cargo);
	_loading_allowed = ((_weight_vehicle_maxload - _weight_vehicle_current) >= _weight_cargo); TRACE_1("",_loading_allowed);
	if (!_loading_allowed) then { _error = format["Weight/Volume of cargo (%1) exceeds allowed values for %2",_x,(typeOf _vehicle)]; };
	if (_loading_allowed && {_preloading_allowed}) then {
		_newcontent = _currentcontent;
		_newcontent set [count _newcontent,_x]; TRACE_1("New content", _newcontent);
		_vehicle setVariable [QGVAR(content), _newcontent, true]; // Add cargo variables
		_cargo_pos = getPosATL _x;
		detach _x;
		// TODO: Test enableSimulation = false; on loaded object
		
		//_x setPos [_cargo_pos select 0, _cargo_pos select 1, (_cargo_pos select 2) - 20]; TRACE_1("Setpos cargo item",(getPos _x));
		// Put stuff to [0,0,0] no matter what
		_x setPos [0,0,0];
		
		//_x spawn { // Check if cargo item is below surface
		//	private "_cargo_item";
		//	_cargo_item = _this;
		//	sleep 5;
		//	if ((getPos _cargo_item select 2) > 0) then {
		//		TRACE_1("Item hiding below surface failed, setting to [0,0,0]","");
		//		_cargo_item setPos [0,0,0]; // TODO: allowdamage false while on "hiding pos"??
		//	};
		//};
	
		[_x,"set"] call FUNC(determineCargo);
	} else {
		WARNING(_error);
	};
} foreach _cargo;