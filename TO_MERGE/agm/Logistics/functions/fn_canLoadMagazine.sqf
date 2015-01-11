/*
	Name: AGM_Logistics_fnc_canLoadMagazine
	
	Author:
		commy2
		Garth de Wet (LH)
	
	Description:
		Checks whether the passed magazine can be loaded into the vehicle
	
	Parameters:
		0: OBJECT - vehicle to load
		1: STRING - name of magazine to load
		
	Returns:
		BOOLEAN
	
	Example:
		_canLoad = [AGM_Interaction_Target, "Titan_AA"] call AGM_Logistics_fnc_canLoadMagazine;
*/
private ["_vehicle", "_magazine", "_weapon"];
_vehicle = _this select 0;
_magazine = _this select 1;
_weapon = (_this call AGM_Logistics_fnc_getWeaponsOfMagazine) select 0;
_result = false;

if (getNumber (configFile >> "CfgMagazines" >> _magazine >> "AGM_MagazineReloadType") == 1) then {
	// The magazine is wrong, it needs to be the currently loaded magazine not the magazine to load.
	_result = (_vehicle ammo _weapon) < getNumber (configFile >> "CfgMagazines" >> _magazine >> "count");
} else {
	_result = true;
};

_result
