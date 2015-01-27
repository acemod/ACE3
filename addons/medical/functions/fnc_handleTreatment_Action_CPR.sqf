/**
 * fn_performCPR.sqf
 * @Descr: Start the CPR action from CMS. Caller unit will attempt to restart the targets heart using CPR.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT (The unit that cPR will be performed upon), caller OBJECT (The unit that does the CPR action)]
 * @Return: void
 * @PublicAPI: true
 */

#include "script_component.hpp"

#define CPR_TIME    25    // time in seconds

private ["_caller","_target", "_selectionName", "_prevAnim"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;
_prevAnim = _this select 4;

// only allow CPR once
if (_caller getvariable[QGVAR(isProvidingCPR), false]) exitwith {true};

_caller setvariable[QGVAR(isProvidingCPR), true, true];

[_this] call EFUNC(common,debug);
[_caller] call FUNC(treatmentMutex);

if (_target == _caller) exitwith{[_caller,"You cannot give yourself CPR"] call EFUNC(common,sendHintTo); true};

[_caller,"You start providing CPR"] call EFUNC(common,sendHintTo);

if (vehicle _target == _target) then {
    [_unit,"AinjPpneMstpSnonWrflDnon_rolltoback", 1] call EFUNC(common,doAnimation);
};

_caller setvariable [QGVAR(StartingPositionHandleTreatment), getPos _caller];
[CPR_TIME,
    {((vehicle (_this select 0) != (_this select 0)) ||((getPos (_this select 0)) distance ((_this select 0) getvariable QGVAR(StartingPositionHandleTreatment)) < 1)) && (_caller getvariable[QGVAR(isProvidingCPR), false])}, // the condition
    {
        private ["_caller","_target", "_selectionName", "_prevAnim"];
        _caller = _this select 0;
        _target = _this select 1;
        _selectionName = _this select 2;
        _removeItem = _this select 3;

        [[_caller, _target], QUOTE(FUNC(handleTreatment_Action_CPRLocal)), _target] call EFUNC(common,execRemoteFnc);
        if (_prevAnim != "") then {
            [_caller,_prevAnim, 0] call EFUNC(common,doAnimation);
        };

        _caller setvariable[QGVAR(isProvidingCPR), nil, true];
        ["Medical_handleTreatment_CPR", [_caller, _target, _selectionName, _removeItem, true]] call ace_common_fnc_localEvent;
        ["Medical_treatmentCompleted", [_caller, _target, _selectionName, _removeItem]] call ace_common_fnc_localEvent;
    }, // on success
    {
        private ["_caller","_target", "_selectionName", "_prevAnim"];
        [(_this select 0), "STR_ACE_CANCELED", ["STR_ACE_ACTION_CANCELED","STR_ACE_YOU_MOVED_AWAY"]] call EFUNC(gui,sendDisplayInformationTo);

        if (_prevAnim != "") then {
            [_caller,_prevAnim, 0] call EFUNC(common,doAnimation);
        };
        _caller setvariable[QGVAR(isProvidingCPR), nil, true];
        ["Medical_handleTreatment_CPR", [_caller, _target, _selectionName, _removeItem, false]] call ace_common_fnc_localEvent;
        ["Medical_treatmentCompleted", [_caller, _target, _selectionName, _removeItem]] call ace_common_fnc_localEvent;
    },    // on failure
    [_caller, _target, _selectionName, _removeItem, _prevAnim] // arguments
] call EFUNC(gui,loadingBar);

true;