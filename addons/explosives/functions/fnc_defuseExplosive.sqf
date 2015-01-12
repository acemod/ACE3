/*
	Name: ACE_Explosives_fnc_defuseExplosive

	Author: Garth de Wet (LH)

	Description:
		Defuses an Explosive

	Parameters:
		0: OBJECT - unit
		1: OBJECT - Explosive

	Returns:
		Nothing

	Example:
		[player, ACE_Interaction_Target] call ACE_Explosives_fnc_defuseExplosive;
*/
#include "\z\ace\explosives\script_component.hpp"
private ["_unit", "_explosive"];
_unit = _this select 0;
_explosive = _this select 1;

if (getNumber (ConfigFile >> "CfgAmmo" >> typeof _explosive >> "ACE_explodeOnDefuse") == 1) exitWith {
	[_unit, -1, [_explosive, 1], true] call FUNC(detonateExplosive);
};

_unit action ["Deactivate", _unit, _explosive];
