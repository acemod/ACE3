/*
	Name: AGM_Explosives_fnc_getDetonators
	
	Author(s):
		Garth de Wet (LH)
	
	Description:
		Gets all the detonators of a specific unit
	
	Parameters:
		0: OBJECT - Unit to get detonators of
	
	Returns:
		ARRAY - Configs of all detonators.
	
	Example:
		_detonators = [player] call AGM_Explosives_fnc_getDetonators;
*/
private ["_unit", "_items", "_result", "_config"];
_unit = _this select 0;
_items = (items _unit);
_result = [];

{
	_config = ConfigFile >> "CfgWeapons" >> _x;
	if (getNumber (_config >> "AGM_Detonator") == 1) then {
		_result pushBack _x;
	};
} forEach _items;

_result
