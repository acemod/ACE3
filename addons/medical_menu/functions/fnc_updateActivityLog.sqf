/*
 * Author: Glowbal
 * Update the activity log
 *
 * Arguments:
 * 0: display <DISPLAY>
 * 1: log collection <ARRAY>
 *
 * Return Value:
 * NONE
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_display", "_logs", "_logCtrl"];
_display = _this select 0;
_logs = _this select 1;

_logCtrl = (_display displayCtrl 214);
lbClear _logCtrl;

private ["_message", "_moment", "_arguments"];
{
    // [_message,_moment,_type, _arguments]
    _message = _x select 0;
    _moment = _x select 1;
    _arguments = _x select 3;
    if (isLocalized _message) then {
        _message = localize _message;
    };

    {
        if (typeName _x == "STRING" && {isLocalized _x}) then {
            _arguments set [_foreachIndex, localize _x];
        };
    }foreach _arguments;
    _message = format([_message] + _arguments);
    _logCtrl lbAdd format["%1 %2", _moment, _message];
}foreach _logs;
