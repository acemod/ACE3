// by commy2
#include "script_component.hpp"

private "_unit";

_unit = _this select 0;

if !([_unit] call FUNC(canClimb)) exitWith {
	[localize "STR_ACE_Movement_CanNotClimb"] call EFUNC(common,displayTextStructured);
};

if !(_unit getVariable [QGVAR(isClimbInit), false]) then {
	_unit addEventHandler ["AnimDone", {
		if (local (_this select 0) && {_this select 1 == "ACE_Climb"}) then {_this call FUNC(handleClimb)};
	}];

	_unit setVariable [QGVAR(isClimbInit), true];
};

[_unit] call EFUNC(common,fixLoweredRifleAnimation);
[_unit, "AmovPercMstpSnonWnonDnon", 2] call EFUNC(common,doAnimation);
[_unit, "ACE_Climb", 0] call EFUNC(common,doAnimation);
