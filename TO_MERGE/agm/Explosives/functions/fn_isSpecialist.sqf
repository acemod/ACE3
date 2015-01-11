/*
	Name: AGM_Explosives_fnc_isSpecialist
	
	Author: Garth de Wet (LH)
	
	Description:
		Checks whether the passed unit is an explosive specialist.
		Either through config entry: "canDeactivateMines"
		or 
		unit setVariable ["AGM_isEOD", true]
	
	Parameters: 
		OBJECT - Unit to check if is a specialist
	
	Returns:
		BOOLEAN
	
	Example:
		_isSpecialist = player call AGM_Explosives_fnc_isSpecialist;
*/
private "_isSpecialist";
_isSpecialist = _this getVariable "AGM_isEOD";
if (isNil "_isSpecialist") then {
	_isSpecialist = getNumber(ConfigFile >> "CfgVehicles" >> typeof _this >> "canDeactivateMines") == 1;
};
_isSpecialist
