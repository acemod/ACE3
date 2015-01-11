/*
	Name: AGM_Explosives_fnc_startTimer
	
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
		[_explosive, 10] call AGM_Explosives_fnc_startTimer;
*/
_this spawn {
	private ["_explosive", "_timer"];
	_explosive = _this select 0;
	_timer = _this select 1;
	
	sleep _timer;
	if (!isNull _explosive) then {
		[_explosive, -1, [_explosive, 0], true] call AGM_Explosives_fnc_DetonateExplosive;
	};
};
