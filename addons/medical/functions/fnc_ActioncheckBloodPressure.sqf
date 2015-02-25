/**
 * fn_checkBloodPressure.sqf
 * @Descr: Displays specified units current blood pressure
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_caller","_target","_title","_content"];
_caller = _this select 0;
_target = _this select 1;

if ([_caller] call FUNC(isSetTreatmentMutex)) exitwith {};
[_caller, true] call FUNC(treatmentMutex);

_title = format["STR_ACE_CHECK_BLOODPRESSURE"];
_content = ["STR_ACE_CHECK_BLOODPRESSURE_CONTENT"];
[_caller, _title, _content] call EFUNC(common,sendDisplayInformationTo);

_caller setvariable [QGVAR(StartingPositionHandleTreatment), getPos _caller];
[2 + round(random(1)),
    {((vehicle (_this select 0) != (_this select 0)) ||((getPos (_this select 0)) distance ((_this select 0) getvariable QGVAR(StartingPositionHandleTreatment)) < 1))}, // the condition
    {
        private ["_caller","_target"];
        _caller = _this select 0;
        _target = _this select 1;
        [_this, QUOTE(FUNC(actionCheckBloodPressureLocal)), _target] call EFUNC(common,execRemoteFnc);
        [_caller,false] call FUNC(treatmentMutex);
    }, // on success
    {
        [(_this select 0), "STR_ACE_CANCELED", ["STR_ACE_ACTION_CANCELED","STR_ACE_YOU_MOVED_AWAY"]] call EFUNC(common,sendDisplayInformationTo);
        [(_this select 0),false] call FUNC(treatmentMutex);
    },    // on failure
    [_caller, _target] // arguments
] call EFUNC(common,loadingBar);

