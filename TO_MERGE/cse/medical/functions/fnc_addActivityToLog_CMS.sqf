/**
 * fn_addActivityToLog_CMS.sqf
 * @Descr: adds an item to the activity log
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT, type STRING, message STRING]
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit","_caller","_type","_activity","_log"];

_unit = _this select 0;
_type = _this select 1;
_message = _this select 2;

if (!local _unit) exitwith {
	[_this, QUOTE(FUNC(addActivityToLog_CMS)), _unit, false] spawn BIS_fnc_MP;
};
_lastNumber = date select 4;
_moment = format["%1:%2",date select 3, _lastNumber];
if (_lastNumber < 10) then {
	_moment = format["%1:0%2",date select 3, _lastNumber];
};


_log = [_unit, QGVAR(activityLog)] call EFUNC(common,getDefinedVariable);
if (count _log >= 8) then {
	_newLog = [];
	_counter = 0;
	{
		// ensure the first element will not be added
		if (_counter > 0) then {
			_newLog pushback _x;
		} else {
			_counter = _counter + 1;
		};
	}foreach _log;
	_log = _newLog;
};
_log pushback [_message,_moment,_type];

[_unit, QGVAR(activityLog),_log] call EFUNC(common,setDefinedVariable);