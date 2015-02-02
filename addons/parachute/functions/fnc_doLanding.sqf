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
GVAR(PFH) = false;
[_unit, "AmovPercMevaSrasWrflDf_AmovPknlMstpSrasWrflDnon", 2] call EFUNC(common,doAnimation);
[{
	if (diag_tickTime >= ((_this select 0) select 0) + 1) then {
		((_this select 0) select 1) playActionNow "Crouch";
		[(_this select 1)] call CALLSTACK(cba_fnc_removePerFrameHandler);
	};
}, 1, [diag_tickTime,_unit]] call CALLSTACK(cba_fnc_addPerFrameHandler);
