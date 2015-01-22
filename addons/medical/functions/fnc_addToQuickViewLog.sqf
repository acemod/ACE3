/**
 * fn_addToQuickViewLog.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit","_type","_activity","_log", "_lastNumber", "_message"];

_unit = _this select 0;
_type = _this select 1;
_message = _this select 2;

if (!local _unit) exitwith {
    [_this, QUOTE(FUNC(addToQuickViewLog)), _unit] call EFUNC(common,execRemoteFnc);
};

_lastNumber = date select 4;
_moment = format["%1:%2",date select 3, _lastNumber];
if (_lastNumber < 10) then {
    _moment = format["%1:0%2",date select 3, _lastNumber];
};

_log = [_unit,QGVAR(quickViewLog)] call EFUNC(common,getDefinedVariable);
if (count _log >= 8) then {
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
_log pushback [_message,_moment,_type];

[_unit,QGVAR(quickViewLog),_log] call EFUNC(common,setDefinedVariable);
["Medical_onQuickViewLogChanged", [_unit, _type, _message]] call ace_common_fnc_localEvent;