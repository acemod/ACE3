/*
	Name: ACE_Explosives_fnc_hasExplosives

	Author: Garth de Wet (LH)

	Description:
		Whether the passed unit has any explosives on them.

	Parameters:
		0: OBJECT - unit

	Returns:
		BOOLEAN - True if the unit has explosives.

	Example:
		_hasExplosives = [player] call ACE_Explosives_fnc_hasExplosives;
*/
#include "\z\ace\explosives\script_component.hpp"
private ["_unit", "_result", "_magazines"];
_result = false;
_unit = _this select 0;
_magazines = magazines _unit;
{
	if (getNumber (ConfigFile >> "CfgMagazines" >> _x >> "ACE_Placeable") == 1) exitWith {
		_result = true;
	};
} count _magazines;

_result
