/*
	Name: AGM_Explosives_fnc_TriggerType
	
	Author(s):
		Garth de Wet (LH)
	
	Description:
		Gets the types of triggers associated with the explosive
	
	Parameters:
		0: String - Explosive magazine
	
	Returns:
		ARRAY
	
	Example:
		_supports = ["SatchelCharge_Remote_Mag"] call AGM_Explosives_fnc_TriggerType;
*/
private "_result";
_result = [];
_config = getArray (ConfigFile >> "CfgMagazines" >> (_this select 0) >> "AGM_Triggers" >> "AGM_Triggers");
_count = count _config;

for "_index" from 0 to (_count - 1) do {
	_result set [_index, ConfigFile >> "CfgAGM_Triggers" >> (_config select _index)];
};
_result
