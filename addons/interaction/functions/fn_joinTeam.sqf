// by commy2
#include "script_component.hpp"

private ["_unit", "_team", "_message"];

_unit = _this select 0;
_team = _this select 1;

_unit setVariable [QGVAR(assignedFireTeam), _team, true];
[_unit, format ["{_this assignTeam '%1'}", _team]] call EFUNC(core,execRemoteFnc);

if (_unit == AGM_player) then {
	_message = if (_team == "MAIN") then {
		localize "STR_AGM_Interaction_LeftTeam";
	} else {
		_team = localize format ["STR_AGM_Interaction_Team%1", _team];
		format [localize "STR_AGM_Interaction_JoinedTeam", _team];
	};

	[_message] call EFUNC(core,displayTextStructured);
};
