/*
	Name: ACE_Explosives_fnc_startTimer

	Author(s):
		Garth de Wet (LH)

	Description:
		Starts a timer for an explosive.

	Parameters:
		0: OBJECT - Explosive
		1: NUMBER - time till detonation

	Returns:
		Nothing

	Example:
		[_explosive, 10] call ACE_Explosives_fnc_startTimer;
*/
#include "\z\ace\explosives\script_component.hpp"
[{
	private ["_explosive"];
	_explosive = _this select 0;
	if (!isNull _explosive) then {
		[_explosive, -1, [_explosive, 0], true] call FUNC(detonateExplosive);
	};
},_this select 1, _this] call CALLSTACK(CBA_fnc_addPerFrameHandler);
