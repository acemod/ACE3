/**
 * fnc_handleTreatment_Action_CPRLocal.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_caller","_target", "_n"];
_caller = _this select 0;
_target = _this select 1;


_n = _target getvariable [QEGVAR(common,ENABLE_REVIVE_COUNTER),0];
if (_n > 0) then {
    _n = _n - random(20);
    if (_n < 0) then {
        _n = 0;
    };
    _target setvariable [QEGVAR(common,ENABLE_REVIVE_COUNTER), _n];
};

if (random(1)>= 0.6) exitwith {
    [_caller,"CPR Success"] call cse_fnc_sendHintTo;
    _target setvariable [QGVAR(inCardiacArrest), nil,true];

    [_target, QGVAR(heartRate),40] call EFUNC(common,setDefinedVariable);
    [_target, QGVAR(bloodPressure),[50,70]] call EFUNC(common,setDefinedVariable);
};

true;