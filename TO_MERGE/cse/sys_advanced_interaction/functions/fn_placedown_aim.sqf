/*
	NAME: fnc_release
	USAGE: switches state of unit to arrested
	AUTHOR: Glowbal
	ARGUMENTS: OBJECT unit, OBJECT target , of type man
	RETURN: void
*/


	private ["_caller","_cursor"];
	_caller = _this select 0;
	_cursor = _this select 1;
	[_caller,ObjNull] call cse_fnc_carryObj;
	//_cursor switchmove "aidlpsitmstpsnonwnondnon_ground00";
	if ([_cursor] call cse_fnc_isAwake) then {
		[_cursor,"aidlpsitmstpsnonwnondnon_ground00",true] call cse_fnc_broadcastAnim;
	};
	hint format["You place this person on the ground"];
