/*
Function: ACE_fnc_unloadCargo

Description:
	Unloads cargo from a vehicle.

Parameters:
	_cargo - Cargo object to load. (Must exist) [Array of one or more objects]
	_vehicle - Vehicle to load cargo into. (Must exist) [Object]
Returns:
	nothing

Example:
	(begin example)
		[[myCrate1, myCrate2], myTruck] call ACE_fnc_unloadCargo;
	(end)

Author:
	rocko
*/

#include "script_component.hpp"

PARAMS_2(_cargo,_vehicle);
private ["_index", "_currentcontent", "_vehicle", "_cargo", "_newcontent", "_hasPlaceholder", "_placeholder", "_pos"];

_currentcontent = _vehicle getVariable QGVAR(content);
if (isNil "_currentcontent") exitWith {};
{
	if (_x in _currentcontent) then {
		_newcontent = _currentcontent - [_x];
		_vehicle setVariable [QGVAR(content), _newcontent, true]; // Add cargo variables

		_dir = getDir _vehicle - 180 + (random 20) - (random 20);
		_posV = getPosATL _vehicle;
		_unloadPos = [(_posV select 0) + ((sin _dir) * 4), (_posV select 1) + ((cos _dir) * 4),_posV select 2];
		_x setpos _unloadPos;
		if (_x isKindOf "ACE_Rucksack_crate") then {
			_x setVectorDirAndUp [[-0.0204803,-0.585819,0.810183],[0.00794978,-0.810423,-0.585792]];
		};
		if (_x isKindOf "StaticWeapon") then {
			_x setVariable ["ace_sys_crewserved_pitch",0,true];
		};
	};
} foreach _cargo;
[_vehicle,objnull,0,0] call FUNC(cbusy);
