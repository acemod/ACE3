/*
	Name: ACE_Parachute_fnc_doLanding

	Author: Garth de Wet (LH)

	Description:
		Performs the landing animation fix

	Parameters:
		0: OBJECT - unit

	Returns:
		Nothing

	Example:
		[player] call ACE_Parachute_fnc_doLanding;
*/
#include "script_component.hpp"
private ["_unit"];
_unit = _this select 0;
["ACE_ParachuteFix", "OnEachFrame"] call BIS_fnc_removeStackedEventHandler;
ACE_Parachuting_PFH = false;
[_unit, "AmovPercMevaSrasWrflDf_AmovPknlMstpSrasWrflDnon", 2] call ACE_Core_fnc_doAnimation;
[_unit] spawn {
	sleep 1;
	(_this select 0) playActionNow "Crouch";
};
