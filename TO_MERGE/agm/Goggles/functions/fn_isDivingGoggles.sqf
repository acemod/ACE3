/*
	Name: AGM_Goggles_fnc_isDivingGoggles
	
	Author: Garth de Wet (LH)
	
	Description:
	Determines whether current goggles worn by passed unit is diving goggles or a variant of them.
	
	Parameters: 
	0: String - Glasses classname
	
	Returns:
	Boolean - whether diving goggles are worn
	
	Example:
	(goggles player) call AGM_Goggles_fnc_isDivingGoggles;
*/
private ["_result", "_glasses"];
_glasses = _this;
_result = _glasses == "G_Diving";
if (_result) exitWith {true};
_result = [configFile >> "CfgGlasses" >> _glasses, configFile >> "CfgGlasses" >> "G_Diving"] call CBA_fnc_inheritsFrom;
_result
