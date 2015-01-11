/*
 	Name: AGM_Drag_fnc_GetWeight
 	
 	Author(s):
		L-H

 	Description:
		Returns the weight of a crate.
	
	Parameters:
		OBJECT - Crate to get weight of
 	
 	Returns:
		NUMBER - Weight
 	
 	Example:
		_weight = Crate1 call AGM_Drag_fnc_GetWeight;
*/
private ["_totalWeight", "_fnc","_fnc_Extra"];
_totalWeight = 0;
_fnc_Extra = {
	private ["_weight", "_items"];
	_items = _this select 0;
	_weight = 0;
	{
		_weight = _weight + (getNumber (ConfigFile >> (_this select 1) >> _x >> (_this select 2) >> "mass") * ((_items select 1) select _foreachIndex));
	} foreach (_items select 0);
	
	_weight
};
_fnc = {
	private ["_weight", "_items"];
	_items = _this select 0;
	_weight = 0;
	{
		_weight = _weight + (getNumber (ConfigFile >> (_this select 1) >> _x >> "mass") * ((_items select 1) select _foreachIndex));
	} foreach (_items select 0);
	
	_weight
};
_totalWeight = ([getMagazineCargo _this, "CfgMagazines"] call _fnc);
_totalWeight = _totalWeight + ([getItemCargo _this, "CfgWeapons", "ItemInfo"] call _fnc_Extra);
_totalWeight = _totalWeight + ([getWeaponCargo _this, "CfgWeapons", "WeaponSlotsInfo"] call _fnc_Extra);
_totalWeight = _totalWeight + ([getBackpackCargo _this, "CfgVehicles"] call _fnc);

_totalWeight = _totalWeight * 0.5; // Mass in Arma isn't an exact amount but rather a volume/weight value. This attempts to work around that by making it a usable value. (sort of).

_totalWeight
