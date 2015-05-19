#include "script_component.hpp"
/*
	Name: check Cut Parachute

	Author: joko // Jonas

	Description:
	Check if Parachute can be Cuted

	Parameters:
	0: Object

	Returns:
	Boolean
*/
_unit = _this select 0;

if (animationState _unit == "para_pilot" && !(GETVAR(_unit,chuteIsCut,false))) then {true} else {false};