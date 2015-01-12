/**
 * fn_load_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_caller", "_unit","_vehicle", "_loaded"];
_caller = _this select 0;
_unit = _this select 1;

if ([_unit] call cse_fnc_isAwake) exitwith {
	hintSilent "This person is awake and cannot be loaded";
};

[_caller,objNull] call cse_fnc_carryObj;
[_unit,objNull] call cse_fnc_carryObj;
waituntil {(isNull (_unit getvariable ["cse_beingCarried_CMS", objNull]))};

_vehicle = [_caller, _unit] call cse_fnc_loadPerson_F;
if (!isNull _vehicle) then {
	_loaded = _vehicle getvariable ["cse_loaded_casualties_CMS",[]];
	_loaded pushback _unit;
	_vehicle setvariable ["cse_loaded_casualties_CMS",_loaded,true];

	if (!isnil "CSE_DROP_ADDACTION_CMS") then {
		_caller removeAction CSE_DROP_ADDACTION_CMS;
		CSE_DROP_ADDACTION_CMS = nil;
	};
};