/*
 * Author: Glowbal
 * Handles the medication given to a patient.
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Medication Treatment classname <STRING>
 * 2: The medication treatment variablename <STRING>
 * 3: Max dosage <NUMBER>
 * 4: The time in the system <NUMBER>
 * 5: Incompatable medication <ARRAY<STRING>>
 *
 * Return Value:
 * NONE
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_target", "_className", "_variable", "_maxDosage", "_timeInSystem", "_incompatabileMeds", "_foundEntry", "_allUsedMedication","_allMedsFromClassname", "_usedMeds", "_hasOverDosed", "_med", "_limit", "_classNamesUsed", "_decreaseAmount", "_viscosityChange", "_viscosityAdjustment", "_medicationConfig", "_onOverDose", "_painReduce"];
_target = _this select 0;
_className = _this select 1;
_variable = _this select 2;
_maxDosage = _this select 3;
_timeInSystem = _this select 4;
_incompatabileMeds = _this select 5;
_viscosityChange = _this select 6;
_painReduce = _this select 7;

_foundEntry = false;
_allUsedMedication = _target getvariable [QGVAR(allUsedMedication), []];
{
    if (_x select 0 == _variable) exitwith {
        _allMedsFromClassname = _x select 1;
        if !(_className in _allMedsFromClassname) then {
            _allMedsFromClassname pushback _className;
            _x set [1, _allMedsFromClassname];
            _allUsedMedication set [_foreachIndex, _x];
            _target setvariable [QGVAR(allUsedMedication), _allUsedMedication];
        };
        _foundEntry = true;
    };
} foreach _allUsedMedication;

if (!_foundEntry) then {
    _allUsedMedication pushback [_variable, [_className]];
    _target setvariable [QGVAR(allUsedMedication), _allUsedMedication];
};


_usedMeds = _target getvariable [_variable, 0];
if (_usedMeds >= floor (_maxDosage + round(random(2))) && _maxDosage >= 1 && GVAR(enableOverdosing)) then {
    [_target] call FUNC(setDead);
};

_hasOverDosed = 0;
{
    _med = _x select 0;
    _limit = _x select 1;
    {
        _classNamesUsed = _x select 1;
        if ({_x == _med} count _classNamesUsed > _limit) then {
            _hasOverDosed = _hasOverDosed + 1;
        };
    }foreach _allUsedMedication;
}foreach _incompatabileMeds;

if (_hasOverDosed > 0 && GVAR(enableOverdosing)) then {
    _medicationConfig = (configFile >> "ACE_Medical_Advanced" >> "Treatment" >> "Medication");
    _onOverDose = getText (_medicationConfig >> "onOverDose");
    if (isClass (_medicationConfig >> _className)) then {
        _medicationConfig = (_medicationConfig >> _className);
         if (isText (_medicationConfig  >> "onOverDose")) then { _onOverDose = getText (_medicationConfig >> "onOverDose"); };
    };
    if (isNil _onOverDose) then {
        _onOverDose = compile _onOverDose;
    } else {
        _onOverDose = missionNamespace getvariable _onOverDose;
    };
    [_target, _className] call _onOverDose;
};

_decreaseAmount = 1 / _timeInSystem;
_viscosityAdjustment = _viscosityChange / _timeInSystem;

[{
    private ["_args", "_target", "_timeInSystem", "_variable", "_amountDecreased","_decreaseAmount", "_usedMeds", "_viscosityAdjustment", "_painReduce"];
    _args = _this select 0;
    _target = _args select 0;
    _timeInSystem = _args select 1;
    _variable = _args select 2;
    _amountDecreased = _args select 3;
    _decreaseAmount = _args select 4;
    _viscosityAdjustment = _args select 5;
    _painReduce = _args select 6;

    _usedMeds = _target getvariable [_variable, 0];
    _usedMeds = _usedMeds - _decreaseAmount;
    _target setvariable [_variable, _usedMeds];

    _amountDecreased = _amountDecreased + _decreaseAmount;

    // Restoring the viscosity while the medication is leaving the system
    _target setvariable [QGVAR(peripheralResistance), ((_target getvariable [QGVAR(peripheralResistance), 100]) - _viscosityAdjustment) max 0];
    _target setvariable [QGVAR(painSuppress), ((_target getvariable [QGVAR(painSuppress), 0]) - _painReduce) max 0];

    if (_amountDecreased >= 1 || (_usedMeds <= 0) || !alive _target) then {
        [(_this select 1)] call cba_fnc_removePerFrameHandler;
    };
    _args set [3, _amountDecreased];
}, 1, [_target, _timeInSystem, _variable, 0, _decreaseAmount, _viscosityAdjustment, _painReduce / _timeInSystem] ] call CBA_fnc_addPerFrameHandler;
