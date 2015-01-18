/**
 * fn_checkResponse.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_caller","_target"];
_caller = _this select 0;
_target = _this select 1;

if ([_caller] call FUNC(isSetTreatmentMutex)) exitwith {};
[_caller, true] call FUNC(treatmentMutex);

_title = format["STR_ACE_CHECK_RESPONSE"];
_content = ["STR_ACE_CHECK_RESPONSE_CONTENT"];
[_caller, _title, _content] call EFUNC(gui,sendDisplayInformationTo);

_caller setvariable [QGVAR(StartingPositionHandleTreatment), getPos _caller];
[2 + round(random(2)),
    {((vehicle (_this select 0) != (_this select 0)) ||((getPos (_this select 0)) distance ((_this select 0) getvariable QGVAR(StartingPositionHandleTreatment)) < 1))}, // the condition
    {
        private ["_caller","_target", "_output", "_title", "_content"];
        _caller = _this select 0;
        _target = _this select 1;

        _output = "";
        if ([_unit] call EFUNC(common,isAwake)) then {
            _output = format[localize "STR_ACE_CHECK_REPONSE_RESPONSIVE",[_unit] call EFUNC(common,getName)];
        } else {
            _output = format[localize "STR_ACE_CHECK_REPONSE_UNRESPONSIVE",[_unit] call EFUNC(common,getName)];
        };

        _title = format["STR_ACE_CHECK_RESPONSE"];
        _content = [format[localize "STR_ACE_CHECK_REPONSE_YOU_CHECKED",[_unit] call EFUNC(common,getName)],_output];
        [_caller, _title, _content] call EFUNC(gui,sendDisplayInformationTo);
        [_unit,"examine",_output] call FUNC(addToQuickViewLog);

        [_caller,false] call FUNC(treatmentMutex);
    }, // on success
    {
        [(_this select 0), "STR_ACE_CANCELED", ["STR_ACE_ACTION_CANCELED","STR_ACE_YOU_MOVED_AWAY"]] call EFUNC(gui,sendDisplayInformationTo);
        [(_this select 0),false] call FUNC(treatmentMutex);
    },    // on failure
    [_caller, _target] // arguments
] call EFUNC(gui,loadingBar);
