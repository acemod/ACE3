// by commy2

private ["_mode", "_info", "_house", "_door", "_id"];

_mode = _this select 0;		//lock: true, unlock: false

_info = [2] call AGM_Interaction_fnc_getDoor;

_house = _info select 0;
_door = _info select 1;
_id = _info select 2;

!isNull _house
&& {_door == "door"}
&& {!_mode || {_house animationPhase format ["door_%1_rot", _id] <= 0}}
&& {(_house getVariable [format ["BIS_Disabled_Door_%1", _id], 0] != 1) isEqualTo _mode}
