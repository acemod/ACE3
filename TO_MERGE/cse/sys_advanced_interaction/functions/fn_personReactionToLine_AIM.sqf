/**
 * fn_personReactionToLine_AIM.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_target", "_caller", "_civilian", "_array","_position","_textFromCiv", "_conversation"];
_target = _this select 0;
_caller = _this select 1;
_lineType = _this select 2;

if ((_target getvariable ["cse_profile_information_aim",[]]) isEqualTo []) then {
	[[_target], "cse_fnc_generateProfileInformation_AIM", false, false] call BIS_fnc_MP;
	waituntil {!((_target getvariable ["cse_profile_information_aim",[]]) isEqualTo [])};
};
sleep 3;

_array = [_target, _caller, _lineType, ([_target, _caller] call cse_fnc_getReactionTypeOfUnit_AIM)] call cse_fnc_getReactionLinesOfPerson_AIM;
_position = round (random (count _array -1));
_textFromCiv = _array select _position;
titleText [_textFromCiv,"PLAIN DOWN"];

[_target,[_target] call cse_fnc_getName, _textFromCiv ] call cse_fnc_addToConversationLog_AIM;

CSE_PERFORMING_TALKING_ACTION_AIM = false;