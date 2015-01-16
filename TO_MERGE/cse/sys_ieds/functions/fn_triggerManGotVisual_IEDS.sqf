/**
 * fn_triggerManGotVisual_IEDS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_triggerMan","_obj","_return"];
_triggerMan = _this select 0;
_obj = _this select 1;
_return = false;

if (!(_triggerMan getvariable ["cse_ieds_SpotterFleeing_IEDS",false]) && _triggerMan != _obj && alive _triggerMan) then {
	if (_obj distance _triggerMan <350) then {
		_triggerMan doWatch _obj;
		_return = !(lineIntersects [eyePos _triggerMan, getPos _obj,_triggerMan]);
	};
};
_return