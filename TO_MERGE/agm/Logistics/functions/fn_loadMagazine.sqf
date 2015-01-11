/*
	Name: AGM_Logistics_fnc_loadMagazine
	
	Author:
		commy2
		Garth de Wet (LH)
	
	Description:
		Loads the passed magazine into the vehicle from the passed unit
	
	Parameters:
		0: OBJECT - unit to perform loading
		1: OBJECT - vehicle to load
		2: STRING - name of magazine to load
		
	Returns:
		Nothing
	
	Example:
		[player,AGM_Interaction_Target, "Titan_AA"] call AGM_Logistics_fnc_loadMagazine;
*/
private ["_unit", "_vehicle", "_magazine"];
_unit = _this select 0;
_vehicle = _this select 1;
_magazine = _this select 2;

_weapon = ([_vehicle, _magazine] call AGM_Logistics_fnc_getWeaponsOfMagazine) select 0;
if (_unit == player) then {
	[10, [_unit, _vehicle, _magazine, _weapon], "AGM_Logistics_fnc_loadMagazineCallback", "Loading Magazine ..."] call AGM_Core_fnc_progressBar;
} else {
	sleep 10;
	[_unit, _vehicle, _magazine, _weapon] call AGM_Logistics_fnc_loadMagazineCallback;
};
