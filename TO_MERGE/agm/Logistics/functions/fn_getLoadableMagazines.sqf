/*
	Name: AGM_Logistics_fnc_getLoadableMagazines
	
	Author:
		commy2
		Garth de Wet (LH)
	
	Description:
		Gets all magazines loadable from the unit into the target vehicle
	
	Parameters:
		0: OBJECT - unit to check magazines of
		1: OBJECT - vehicle to check weapons and magazine types.
	
	Returns:
		ARRAY - Loadable magazines of the unit for the vehicle.
	
	Example:
		_mags = [player, AGM_Interaction_Target] call AGM_Logistics_fnc_getLoadableMagazines;
*/
private ["_vehicle", "_weapons", "_magazines"];
_unit = _this select 0;
_vehicle = _this select 1;

_weapons = weapons _vehicle;

_magazines = [];
{
	_magazines = _magazines + getArray (configfile >> "CfgWeapons" >> _x >> "AGM_Magazines");
} forEach _weapons;

_unitMagazines = magazines _unit;	//(magazines _unit + magazineCargo _vehicle))
{
	if (!(_x in _unitMagazines) || {!([_vehicle, _x] call AGM_Logistics_fnc_canLoadMagazine)}) then {
		_magazines = _magazines - [_x];
	};
} forEach _magazines;

_magazines
