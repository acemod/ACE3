/**
 * fn_addToConversationLog_AIM.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit","_caller","_type","_activity","_log"];
_unit = _this select 0;
_nameOf = _this select 1;
_message = _this select 2;

_log = [_unit,"cse_dialog_recorded_conversation_aim"] call cse_fnc_getVariable;
if (count _log >= 12) then {
	_newLog = [];
	_counter = 0;
	{
		if (_counter > 0) then {
			_newLog pushback _x;
		} else {
			_counter = _counter + 1;
		};
	}foreach _log;
	_log = _newLog;
};
_log set [count _log, [_nameOf,_message]];

[_unit,"cse_dialog_recorded_conversation_aim",_log] call cse_fnc_setVariable;
