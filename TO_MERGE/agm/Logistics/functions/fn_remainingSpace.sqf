/*
	Name: AGM_Logistics_fnc_remainingSpace
	
	Author: Garth de Wet (LH)
	
	Description:
		
	
	Parameters: 
		0: NUMBER - Load Size of vehicle
		1: ARRAY - Objects stored in vehicle
	
	Returns:
		ARRAY:
			ARRAY:
				0: STRING - memory point
				1: NUMBER - load size
				2: ARRAY - load position
					0: NUMBER - X
					1: NUMBER - Y
					2: NUMBER - z
				3: ARRAY (OBJECTS) - Currently loaded items in load point
	
	Example:
		_freeSpace = [3, (_truck call AGM_Logistics_fnc_getLoadPoints) select 3] call AGM_Logistics_fnc_remainingSpace;
*/
private  ["_size", "_objects", "_usedSize", "_objSize"];
_size = _this select 0;
_objects = _this select 1;
_usedSize = 0;
{
	_objSize = 1;
	if (isNumber (ConfigFile >> "CfgVehicles" >> typeof(_x) >> "AGM_Size")) then {
		_objSize = getNumber(ConfigFile >> "CfgVehicles" >> typeof(_x) >> "AGM_Size");
	};
	_usedSize = _usedSize + _objSize;
} count _objects;

(_size - _usedSize)
