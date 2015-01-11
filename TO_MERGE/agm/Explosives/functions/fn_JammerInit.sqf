/*
	Name: AGM_Explosives_fnc_JammerInit
	
	Author(s):
		Garth de Wet (LH)
	
	Description:
		
	
	Parameters:
		0:OBJECT - unit carrying
		1:OBJECT - Jammer
	
	Returns:
		Nothing
	
	Example:
		[player,JammerObject] call AGM_Explosives_fnc_JammerInit;
*/
if (isClass (configFile >> "CfgVehicles" >> (typeof (_this select 1))) and {getNumber(configFile >> "CfgVehicles" >> (typeof (_this select 1)) >> "AGM_JammerRange") > 0}) then {
	private ["_found"];
	_found = false;
	{
		if ((_x select 2) == (_this select 1)) exitWith	{
			_x set [0, (_this select 0)];
			_found = true;
		};
	} count AGM_Explosives_Jammers;
	if !(_found) then {
		AGM_Explosives_Jammers pushBack [(_this select 0), getNumber(configFile >> "CfgVehicles" >> (typeof (_this select 1)) >> "AGM_JammerRange"),(_this select 1)];
	};
	publicVariable "AGM_Explosives_Jammers";
	private "_check";
	_check = (_this select 1) getVariable "AGM_JammerCharge";
	if (isNil "_check") then {
		(_this select 1) setVariable ["AGM_JammerCharge", getNumber(configFile >> "CfgVehicles" >> (typeof (_this select 1)) >> "AGM_JammerMaxCharge"), true];
	};
	_check = (_this select 1) getVariable "AGM_JammerEnabled";
	if (isNil "_check") then {
		(_this select 1) setVariable ["AGM_JammerEnabled", false, true];
	};
};
