/*
* fnc_setPosition.sqf
*
* Author: Garth 'L-H' de Wet
* Sets the Dir and pitch of passed object
*
* Arguments:
* 0: Explosive <OBJECT>
* 1: Direction <NUMBER>
* 2: Pitch <NUMBER>
*
* Return Value:
* None
*
* Example:
* [_explosive, 150, 90] call ACE_Explosives_fnc_SetPos;
*
* Public: Yes
*/
#include "script_component.hpp"
private "_ex";
_ex = _this select 0;
_ex setDir (_this select 1);
if ((_this select 2) != 0) then {
	[_ex, _this select 2, 0] call CALLSTACK(BIS_fnc_setPitchBank);
};
//_ex setVectorUp (surfaceNormal _pos);
