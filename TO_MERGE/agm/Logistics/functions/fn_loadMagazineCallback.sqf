/*
	Name: AGM_Logistics_fnc_loadMagazineCallback
	
	Author:
		commy2
		Garth de Wet (LH)
	
	Description:
	
	Parameters:
		0: OBJECT - unit to perform loading
		1: OBJECT - vehicle to load
		2: STRING - name of magazine to load
		3: STRING - Weapon
		
	Returns:
		Nothing
	
	Example:
		[player,AGM_Interaction_Target, "Titan_AA", "missiles_titan"] call AGM_Logistics_fnc_loadMagazineCallback;
*/
private ["_unit", "_vehicle", "_magazine"];
_unit = _this select 0;
_vehicle = _this select 1;
_magazine = _this select 2;
_weapon = _this select 3;

if !([_vehicle, _magazine] call AGM_Logistics_fnc_canLoadMagazine) exitWith {};

if (_magazine in magazines _unit) then {
	_unit removeMagazineGlobal _magazine;
	
	_itemName = getText (configFile >> "CfgMagazines" >> _magazine >> "displayName");
	_vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
	[format ["%1 loaded into %2", _itemName, _vehicleName], true] call AGM_Core_fnc_displayText;
	
	[[_vehicle, _magazine, _weapon], "AGM_Logistics_fnc_loadMagazineRemote", _vehicle] call AGM_Core_fnc_execRemoteFnc;
};
