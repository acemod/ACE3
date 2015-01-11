//fnc_bcsLog.sqf
#include "script_component.hpp"
disableSerialization;
_logText = "";
_refill = false;
if(IS_ARRAY(_this)) then {
	_logText = _this select 0;
	_refill = true;
} else {
	_logText = _this;
};
_log = "";
if(!_refill) then {
	_dateAr = ["%1-%2-%3 %4:%5"] + date;
	_date = format _dateAr;
	_log = format["%1: %2", _date, _logText];
	_logData = GVAR(currentComputer) getVariable [QGVAR(logData), []];
	_logData set[(count _logData), _log];
	GVAR(currentComputer) setVariable [QGVAR(logData), _logData];
	TRACE_1("BCS LOG DATA", _log);
} else {
	_log = _logText;
};
_index = lbAdd [10021, _log];
lbSetCurSel [10021, _index];