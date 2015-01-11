/*
	Name: AGM_Parachute_fnc_doLanding
	
	Author: Garth de Wet (LH)
	
	Description:
		Performs the landing animation fix
	
	Parameters: 
		0: OBJECT - unit
	
	Returns:
		Nothing
	
	Example:
		[player] call AGM_Parachute_fnc_doLanding;
*/
_unit = _this select 0;
["AGM_ParachuteFix", "OnEachFrame"] call BIS_fnc_removeStackedEventHandler;
AGM_Parachuting_PFH = false;
[_unit, "AmovPercMevaSrasWrflDf_AmovPknlMstpSrasWrflDnon", 2] call AGM_Core_fnc_doAnimation;
[_unit] spawn {
	sleep 1;
	(_this select 0) playActionNow "Crouch";
};