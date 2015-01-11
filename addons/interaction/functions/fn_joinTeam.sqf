// by commy2

private ["_unit", "_team", "_message"];

_unit = _this select 0;
_team = _this select 1;

_unit setVariable ["AGM_assignedFireTeam", _team, true];
[_unit, format ["{_this assignTeam '%1'}", _team]] call AGM_Core_fnc_execRemoteFnc;

if (_unit == AGM_player) then {
	_message = if (_team == "MAIN") then {
		localize "STR_AGM_Interaction_LeftTeam";
	} else {
		_team = localize format ["STR_AGM_Interaction_Team%1", _team];
		format [localize "STR_AGM_Interaction_JoinedTeam", _team];
	};

	[_message] call AGM_Core_fnc_displayTextStructured;
};
