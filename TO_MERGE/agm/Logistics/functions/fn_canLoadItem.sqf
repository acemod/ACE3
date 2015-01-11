/*
	Name: AGM_Logistics_fnc_getLoadPoints
	
	Author: 
		commy2
		Garth de Wet (LH)
	
	Description:
		
	
	Parameters: 
		0: OBJECT - item to attempt to load
	
	Returns:
		BOOLEAN
	
	Example:
		_attachPoints = _truck call AGM_Logistics_fnc_getLoadPoints;
*/
#define TRUNK_SELECTION "doplnovani"
#define MAX_DISTANCE 8

_nearestVehicles = [
	getPos player nearestObject "Car",
	getPos player nearestObject "Tank",
	getPos player nearestObject "Helicopter",
	getPos player nearestObject "Plane",
	getPos player nearestObject "Ship"
];

_distances = [];
{
	if (typeName _x == "OBJECT") then {
		_distances pushBack (player distance _x);
	};
} forEach _nearestVehicles;

_distance = MAX_DISTANCE;
{
	_distance = _distance min _x;
} forEach _distances;

if (_distance == MAX_DISTANCE) exitWith {false};
_result = false;

AGM_Logistics_targetVehicle = _nearestVehicles select (_distances find _distance);
_size = getNumber(ConfigFile >> "CfgVehicles" >> Typeof(_this select 0) >> "AGM_Size");
if (isClass (configFile >> "CfgVehicles" >> typeOf(AGM_Logistics_targetVehicle) >> "AGM_Load")) then {
	_attachPoints = AGM_Logistics_targetVehicle call AGM_Logistics_fnc_getLoadPoints;
	{
		if ([_x select 1, _x select 3] call AGM_Logistics_fnc_remainingSpace >= _size) exitWith {
			_result = true;
		};
	} forEach _attachPoints;
} else {
	_loadedItems = AGM_Logistics_targetVehicle getVariable ["AGM_Logistics_loadedItems", []];
	if ([getNumber (configFile >> "CfgVehicles" >> typeOf AGM_Logistics_targetVehicle >> "AGM_Vehicle_Cargo"), _loadedItems] call AGM_Logistics_fnc_remainingSpace >= _size) then {
		_result = true;
	};
};
_result && {_this select 0 != missionNamespace getVariable ["AGM_Fortifications_crate", objNull]}
