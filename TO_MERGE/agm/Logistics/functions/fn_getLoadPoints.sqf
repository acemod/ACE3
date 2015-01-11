/*
	Name: AGM_Logistics_fnc_getLoadPoints
	
	Author: Garth de Wet (LH)
	
	Description:
		
	
	Parameters: 
		OBJECT - vehicle
	
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
				4: STRING - Class name
	
	Example:
		_attachPoints = _truck call AGM_Logistics_fnc_getLoadPoints;
*/
private ["_result", "_config", "_count", "_class"];
_result = [];

_config = configFile >> "CfgVehicles" >> typeOf(_this) >> "AGM_Load";
_count = count _config;

for "_index" from 0 to (_count - 1) do {
	_class = _config select _index;
	if (isClass (_class)) then {
		_result pushBack [getText (_class >> "memoryPoint"), getNumber (_class >> "loadSize"), GetArray(_class >> "loadPosition"), _this getVariable [format["AGM_Load_%1", configName _class], []], configName _class];
	};
};

_result
