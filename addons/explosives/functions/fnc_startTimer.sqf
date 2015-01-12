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
#include "script_component.hpp"
_this spawn { // TODO: use scheduled delay execution
	private ["_explosive", "_timer"];
	_explosive = _this select 0;
	_timer = _this select 1;

	sleep _timer;
	if (!isNull _explosive) then {
		[_explosive, -1, [_explosive, 0], true] call FUNC(detonateExplosive);
	};
};
