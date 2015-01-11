/*
	Author: aeroson
	
	Description:
		Shows the actual text and sets text the crew info		

	Parameters: 
		None

	Returns:
		Nothing
*/

#include "common.sqf"

private["_roleImages", "_player", "_vehicle", "_type", "_config", "_text", "_data", "_isAir", "_turretUnits", "_turretRoles", "_index", "_roleType", "_unit", "_toShow"];


_player = AGM_player;
_vehicle = vehicle _player;
_type = typeOf _vehicle;
_config = configFile >> "CfgVehicles" >> _type;
_text = format["<t size='1.4'><img image='%1'></t> <t size='1.7' shadow='true'>%2</t><br/>", getText(_config>>"picture"), getText (_config >> "DisplayName")];



_data = [_type] call AGM_CrewInfo_fnc_getVehicleData;

_isAir = _data select 0;
_data = _data select 1;

_turretUnits = [_data, { _vehicle turretUnit (_x select 0) } ] call AGM_Core_fnc_map;
_turretRoles = [_data, { _x select 1 } ] call AGM_Core_fnc_map;


_roleType = CARGO;
_toShow = [];
{
	switch (_x) do {				
		case commander _vehicle: {
			_roleType = COMMANDER;
		};
		case gunner _vehicle: {
			_roleType = GUNNER;
		};					
		case driver _vehicle: {	 
			_roleType = if(_isAir) then { PILOT } else { DRIVER };
		};					
		default {
			_index = _turretUnits find _x;
			if(_index !=-1 ) then {
				_roleType = _turretRoles select _index;
			} else {
				_roleType = CARGO;
			};
		};
	};
	_toShow pushBack [_x, _roleType];
} forEach crew _vehicle;


_toShow = [
	_toShow,
	[],
	{
		_x select 1	
	},
	"ASCEND",
	{
		_unit = _x select 0;
		alive _unit
	}
] call BIS_fnc_sortBy;


_roleImages = ROLE_IMAGES;
{	
	_unit = _x select 0;
	_roleType = _x select 1;
	_text = _text + format["<t size='1.5' shadow='true'>%1</t> <t size='1.3'><img image='%2'></t><br/>", [_unit] call AGM_Core_fnc_getName, _roleImages select _roleType];
} forEach _toShow;


("AGM_CrewInfo_CrewInfo" call BIS_fnc_rscLayer) cutRsc ["AGM_CrewInfo_dialog", "PLAIN", 1, false];

terminate (missionNamespace getVariable ["AGM_CrewInfo_hideCrewInfoHandle", scriptNull]);
AGM_CrewInfo_hideCrewInfoHandle = 0 spawn {
    sleep 2;
    ("AGM_CrewInfo_CrewInfo" call BIS_fnc_rscLayer) cutFadeOut 2;
};

[_text] call AGM_CrewInfo_fnc_setText;
