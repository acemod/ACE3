/**
 * fn_loadLocal_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


// NO LONGER USED.

private ["_unit","_vehicle","_caller"];
_unit = _this select 0;
_vehicle = _this select 1;
_caller = _this select 2;

[_unit,_vehicle,_caller] spawn {
	[_this] call cse_fnc_debug;
	private ["_unit","_vehicle","_caller"];
	_unit = _this select 0;
	_vehicle = _this select 1;
	_caller = _this select 2;

	//_dead = false;
	//if !(alive _unit) then {
		//_dead = true;
		//_unit = [_unit,_caller] call cms_fnc_switchDeadBody;
		//_unit setvariable ["cms_isDead", true,true];
	//};

	_unit moveInCargo _vehicle;
	_loaded = _vehicle getvariable ["cse_loaded_casualties_CMS",[]];
	_loaded pushback _unit;
	_vehicle setvariable ["cse_loaded_casualties_CMS",_loaded,true];

	if (!([_unit] call cse_fnc_isAwake)) then {
		waituntil {vehicle _unit == _vehicle};
		[_unit,([_unit] call cse_fnc_getDeathAnim)] call cse_fnc_broadcastAnim;
	};
};