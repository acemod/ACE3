/**
 * fn_playerSpeaksLine_AIM.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_target", "_caller", "_civilian", "_array","_position","_textFromCiv", "_conversation", "_typeSelected"];
_target = _this select 0;
_caller = _this select 1;

if (CSE_PERFORMING_TALKING_ACTION_AIM) exitwith {};

waituntil {!CSE_PERFORMING_TALKING_ACTION_AIM};
CSE_PERFORMING_TALKING_ACTION_AIM = true;

_typeSelected = lbCurSel 400;
_array = [_target, _caller, _typeSelected] call cse_fnc_getPlayerSpokenLineType_AIM;
_position = round (random (count _array -1));
_textFromCiv = _array select _position;
titleText [_textFromCiv,"PLAIN DOWN"];


[_target,[_caller] call cse_fnc_getName, _textFromCiv ] call cse_fnc_addToConversationLog_AIM;


_handle = [_target, _caller, _typeSelected] spawn cse_fnc_personReactionToLine_AIM;