// by commy2

private ["_info", "_house", "_door", "_animations", "_lockedVariable"];

_info = [2] call AGM_Interaction_fnc_getDoor;

_house = _info select 0;
_door = _info select 1;

if (isNull _house) exitWith {};

_animations = [_house, _door] call AGM_Interaction_fnc_getDoorAnimations;

_lockedVariable = _animations select 1;
_animations = _animations select 0;

if (count _animations == 0) exitWith {};

if (_house animationPhase (_animations select 0) <= 0 && {_house getVariable [_lockedVariable select 0, 0] == 1}) exitWith {
	_lockedVariable set [0, _house];
	_lockedVariable spawn compile preprocessFileLineNumbers "\A3\Structures_F\scripts\LockedDoor_open.sqf";
};

AGM_Interaction_isOpeningDoor = true;
playSound "AGM_Sound_Click";

[_house, _animations] spawn {
	_house = _this select 0;
	_animations = _this select 1;

	_phase = _house animationPhase (_animations select 0);
	_position = getPosASL AGM_player;

	_time = time + 0.2;
	_usedMouseWheel = false;
	waitUntil {
		if (inputAction "PrevAction" > 0 || {inputAction "NextAction" > 0}) then {
			_usedMouseWheel = true;
		};

		_phase = _phase + (inputAction "PrevAction" / 12) min 1;
		_phase = _phase - (inputAction "NextAction" / 12) max 0;

		{_house animate [_x, _phase]} forEach _animations;

		!AGM_Interaction_isOpeningDoor || {getPosASL AGM_player distance _position > 1}
	};

	if (!_usedMouseWheel && {time < _time}) then {
		_phase = [0, 1] select (_house animationPhase (_animations select 0) < 0.5);

		{_house animate [_x, _phase]} forEach _animations;
	};

	AGM_Interaction_isOpeningDoor = false;
};
