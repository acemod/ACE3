// by commy2

private ["_mode", "_info", "_house", "_door", "_id", "_phase"];

_mode = _this select 0;		//lock: true, unlock: false

_info = [2] call AGM_Interaction_fnc_getDoor;

_house = _info select 0;
_door = _info select 1;
_id = _info select 2;

if (isNull _house) exitWith {};

/*
_phase = [1, 0] select _mode;

_house animate [format ["%1_%2_rot",          _door, _id], _phase];
_house animate [format ["%1_Handle_%2_rot_1", _door, _id], _phase];
_house animate [format ["%1_Handle_%2_rot_2", _door, _id], _phase];
*/

_house setVariable [format ["BIS_Disabled_%1_%2", _door, _id], [0, 1] select _mode];

playSound "AGM_Sound_Click";

[localize (["STR_AGM_Interaction_UnlockedDoor", "STR_AGM_Interaction_LockedDoor"] select _mode)] call AGM_Core_fnc_displayTextStructured;
