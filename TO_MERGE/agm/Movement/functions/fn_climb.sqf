// by commy2

private "_unit";

_unit = _this select 0;

if !([_unit] call AGM_Movement_fnc_canClimb) exitWith {
	[localize "STR_AGM_Movement_CanNotClimb"] call AGM_Core_fnc_displayTextStructured;
};

if !(_unit getVariable ["AGM_isClimbInit", false]) then {
	_unit addEventHandler ["AnimDone", {
		if (local (_this select 0) && {_this select 1 == "AGM_Climb"}) then {_this call AGM_Movement_fnc_handleClimb};
	}];

	_unit setVariable ["AGM_isClimbInit", true];
};

[_unit] call AGM_Core_fnc_fixLoweredRifleAnimation;
[_unit, "AmovPercMstpSnonWnonDnon", 2] call AGM_Core_fnc_doAnimation;
[_unit, "AGM_Climb", 0] call AGM_Core_fnc_doAnimation;
