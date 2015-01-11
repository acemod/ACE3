/*
	Name: AGM_Explosives_fnc_SetPos
	
	Author(s):
		Garth de Wet (LH)
	
	Description:
		Sets the Dir and pitch
	
	Parameters:
		0: OBJECT - Object
		1: NUMBER - Direction
		2: NUMBER - Pitch
	
	Returns:
		Nothing
	
	Example:
		[_explosive, 150, 90] call AGM_Explosives_fnc_SetPos;
*/
private "_ex";
_ex=_this select 0;
_ex setDir (_this select 1);
if ((_this select 2) != 0) then {
	[_ex, _this select 2, 0] call BIS_fnc_setPitchBank;
};
//_ex setVectorUp (surfaceNormal _pos);
