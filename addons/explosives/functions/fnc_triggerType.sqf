/*
	Name: ACE_Explosives_fnc_TriggerType

	Author(s):
		Garth de Wet (LH)

	Description:
		Gets the types of triggers associated with the explosive

	Parameters:
		0: String - Explosive magazine

	Returns:
		ARRAY

	Example:
		_supports = ["SatchelCharge_Remote_Mag"] call ACE_Explosives_fnc_TriggerType;
*/
#include "\z\ace\explosives\script_component.hpp"
private "_result";
_result = [];
_config = getArray (ConfigFile >> "CfgMagazines" >> (_this select 0) >> "ACE_Triggers" >> "SupportedTriggers");
_count = count _config;

for "_index" from 0 to (_count - 1) do {
	_result set [_index, ConfigFile >> "CfgACE_Triggers" >> (_config select _index)];
};
_result
