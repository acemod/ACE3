/*
	Name: AGM_Logistics_fnc_loadMagazineRemote
	
	Author:
		Garth de Wet (LH)
	
	Description:
		Loads the magazine into the vehicle. Is executed on the owner of the vehicle. (setAmmo requirement)
	
	Parameters:
		0: OBJECT - vehicle to load
		1: STRING - name of magazine to load
		
	Returns:
		Nothing
	
	Example:
		[AGM_Interaction_Target, "Titan_AA"] call AGM_Logistics_fnc_loadMagazineRemote;
*/
private ["_vehicle", "_magazine", "_weapon"];
_vehicle = _this select 0;
_magazine = _this select 1;
_weapon = _this select 2;

if (getNumber (configFile >> "CfgMagazines" >> _magazine >> "AGM_MagazineReloadType") == 1) then {
	_vehicle setAmmo [_weapon, (_vehicle ammo _weapon) + 1];
} else {
	_vehicle addMagazineGlobal _magazine;
};
