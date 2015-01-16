/**
 * fn_personSpeaksLine_AIM.sqf
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

_array = [ ([_target, _caller] call cse_fnc_getReactionTypeOfUnit_AIM) , 0] call cse_fnc_getDialogLines_AIM;
_position = round (random (count _array -1));
_textFromCiv = _array select _position;
titleText [_textFromCiv,"PLAIN DOWN"];

[_target,[_target] call cse_fnc_getName, _textFromCiv ] call cse_fnc_addToConversationLog_AIM;