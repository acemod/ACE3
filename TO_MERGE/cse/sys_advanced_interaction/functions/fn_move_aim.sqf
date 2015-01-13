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
	
	if ([_caller,_cursor,[-0.25,0.5,0]] call cse_fnc_carryObj) then {
		//_cursor switchmove "UnaErcPoslechVelitele2";
		[_cursor,"UnaErcPoslechVelitele2",true] call cse_fnc_broadcastAnim;
		hint format["You move this person"];
	} else {
		//hint format["FAILED"];
	};
	
