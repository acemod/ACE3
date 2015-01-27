/**
 * fnc_handleTreatment_Action_MedicationLocal.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_caller","_target","_selectionName","_removeItem","_attributes"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;

_attributes = switch (_removeItem) do {
    case "ACE_morphine": {
        [QGVAR(givenMorphine),"Morphine"]
    };
    case "ACE_atropine": {
        [QGVAR(givenAtropine),"Atropine"]
    };
    case "ACE_epinephrine": {
        [QGVAR(givenEpinephrine),"Epinephrine"]
    };
    default {[]};
};

if (count _attributes > 1) then {
    private ["_value","_patient"];
    [_target] call FUNC(addToInjuredCollection);
    _value = [_target,(_attributes select 0)] call EFUNC(common,getDefinedVariable);
    [_target,(_attributes select 0),_value + 1] call EFUNC(common,setDefinedVariable);

    _patient = "patient";
    if (_target == _caller) then {
        _patient = "himself";
    };
    [_target,"treatment",format["%1 has given %3 %2",[_caller] call EFUNC(common,getName), (_attributes select 1),_patient]] call FUNC(addActivityToLog);
    [_target,_removeItem] call FUNC(addToTriageList);

    _usedMedication = {
        private ["_target","_var","_usedMed","_morphineUsed","_epiUsed","_atroUsed","_totalUsed"];
        _target = _this select 0;
        _var = _this select 1;
        _overDose = 5;
        _wearOff = 120;

        if (!alive _target) exitwith{};
        if (count _this > 2) then {
            _overDose = _this select 2;
            if (count _this > 3) then {
                _wearOff = _this select 3;
            };
        };
        _usedMed = [_target, _var, 0] call EFUNC(common,getDefinedVariable);
        if (isnil "_usedMed") then {
            _usedMed = 0;
        };
        if (_usedMed > (_overDose + round(random(2)))) then {
            [_target] call EFUNC(common,setDead);
        };

        _morphineUsed = _target getvariable [QGVAR(givenMorphine), 0];
        _epiUsed = _target getvariable [QGVAR(givenEpinephrine), 0];
        _atroUsed = _target getvariable [QGVAR(givenAtropine), 0];
        _totalUsed = _morphineUsed + _epiUsed + _atroUsed;

        if (_totalUsed > 10) then {
            [_target] call EFUNC(common,setDead);
        };
        _wearOff =  _wearOff + (round(random(30)));

        [{
            _target = _this select 0;
            _wearOff = _this select 1;
            _var = _this select 2;

            _amountDecreased = 0;
            _usedMed = [_this select 0, _this select 2] call EFUNC(common,getDefinedVariable);
            if (typeName _usedMed != typeName 0) then {
                _usedMed = 0;
            };

            if (_usedMed > 0) then {
                [{
                    _args = _this select 0;
                    _amountDecreased = _args select 3;
                    _usedMed = ([_args select 0, _args select 2] call EFUNC(common,getDefinedVariable));
                    [_args select 0, _args select 2,_usedMed - 0.001] call EFUNC(common,setDefinedVariable);
                    _amountDecreased = _amountDecreased + 0.001;

                    if (_amountDecreased >= 1 || (_usedMed - 0.001 <= 0)) then {
                        [(_this select 1)] call cba_fnc_removePerFrameHandler;
                    };
                    _args set [3, _amountDecreased];
                }, 1, [_target, _wearOff,_var, 0] ] call CBA_fnc_addPerFrameHandler;
            };
        }, [_target, _wearOff, _var], _wearOff, _wearOff] call EFUNC(common,waitAndExecute);

    };

    private ["_heartRate","_pain"];

    switch (_removeItem) do {
        case "ACE_atropine": {

            _heartRate = [_target, QGVAR(heartRate)] call EFUNC(common,getDefinedVariable);
            //_heartRate = [_target, QGVAR(heartRate)] call EFUNC(common,getDefinedVariable);
            if (alive _target) then {
                if (_heartRate > 0) then {
                    if (_heartRate <= 40) then {
                        [_target, -(10 + random(20)), 30] call FUNC(addHeartRateAdjustment);
                    };

                    if (_heartRate > 40) then {
                        if (_heartRate > 120) then {
                            [_target, -(10 + random(50)), 30] call FUNC(addHeartRateAdjustment);
                        } else {
                            [_target, -(10 + random(40)), 30] call FUNC(addHeartRateAdjustment);
                        };
                    };
                };
                //[_target, QGVAR(heartRate),_heartRate] call EFUNC(common,setDefinedVariable);
                [_target,(_attributes select 0),5] call _usedMedication;
            };
        };
        case "ACE_epinephrine": {
            _heartRate = [_target, QGVAR(heartRate)] call EFUNC(common,getDefinedVariable);
            if (alive _target) then {
                if (_heartRate > 0) then {
                    if (_heartRate <= 40) then {
                        [_target, (10 + random(20)), 30] call FUNC(addHeartRateAdjustment);
                    };

                    if (_heartRate > 40) then {
                        if (_heartRate > 120) then {
                            [_target, (10 + random(50)), 30] call FUNC(addHeartRateAdjustment);
                        } else {
                            [_target, (10 + random(40)), 30, {}] call FUNC(addHeartRateAdjustment);
                        };
                    };
                };
                [_target,(_attributes select 0),3] call _usedMedication;
            };
        };
        case "ACE_morphine": {
            private ["_usedMorphine"];
            _pain = [_target, QGVAR(amountOfPain)] call EFUNC(common,getDefinedVariable);
            _pain = 0;
            //_pain = _pain - 35;
            if (_pain <= 0) then {
                _pain = 0;
            };
            _heartRate = [_target, QGVAR(heartRate)] call EFUNC(common,getDefinedVariable);
            [format["used morphine: %1",_heartRate]] call EFUNC(common,debug);
            if (alive _target) then {
                if (_heartRate > 0) then {
                    if (_heartRate <= 40) then {
                        [_target, -(10 + random(20)), 40] call FUNC(addHeartRateAdjustment);
                    };
                    if (_heartRate > 40) then {
                        if (_heartRate > 120) then {
                            [_target, -(10 + random(50)), 40] call FUNC(addHeartRateAdjustment);
                        } else {
                            [_target, -(10 + random(40)), 40] call FUNC(addHeartRateAdjustment);
                        };
                    };
                };
            };
            [_target, QGVAR(amountOfPain),_pain] call EFUNC(common,setDefinedVariable);
            [_target,(_attributes select 0),4,120] call _usedMedication;
        };
        default {

        };
    };
};
true