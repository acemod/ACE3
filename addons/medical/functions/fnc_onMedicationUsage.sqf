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
 * None
 *
 * Example:
 * [bob, "classname", "varname", 5, 6, ["stuff"]] call ACE_medical_fnc_onMedicationUsage
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_target", "_className", "_variable", "_maxDosage", "_timeInSystem", "_incompatabileMeds", "_viscosityChange", "_painReduce"];
TRACE_8("params",_target,_className,_variable,_maxDosage,_timeInSystem,_incompatabileMeds,_viscosityChange,_painReduce);

private _foundEntry = false;
private _allUsedMedication = _target getVariable [QGVAR(allUsedMedication), []];
{
    _x params ["_variableX", "_allMedsFromClassname"];
    if (_variableX== _variable) exitWith {
        if !(_className in _allMedsFromClassname) then {
            _allMedsFromClassname pushBack _className;
            _x set [1, _allMedsFromClassname];
            _allUsedMedication set [_forEachIndex, _x];
            _target setVariable [QGVAR(allUsedMedication), _allUsedMedication];
        };
        _foundEntry = true;
    };
} forEach _allUsedMedication;

if (!_foundEntry) then {
    _allUsedMedication pushBack [_variable, [_className]];
    _target setVariable [QGVAR(allUsedMedication), _allUsedMedication];
};


private _usedMeds = _target getVariable [_variable, 0];
if (_usedMeds >= floor (_maxDosage + round(random(2))) && _maxDosage >= 1 && GVAR(enableOverdosing)) then {
    [_target] call FUNC(setDead);
};

private _hasOverDosed = 0;
{
    _x params ["_med", "_limit"];
    {
        _x params ["", "_classNamesUsed"];
        if ({_x == _med} count _classNamesUsed > _limit) then {
            _hasOverDosed = _hasOverDosed + 1;
        };
    } forEach _allUsedMedication;
} forEach _incompatabileMeds;

if (_hasOverDosed > 0 && GVAR(enableOverdosing)) then {
    private _medicationConfig = (configFile >> "ACE_Medical_Advanced" >> "Treatment" >> "Medication");
    private _onOverDose = getText (_medicationConfig >> "onOverDose");
    if (isClass (_medicationConfig >> _className)) then {
        _medicationConfig = (_medicationConfig >> _className);
         if (isText (_medicationConfig  >> "onOverDose")) then { _onOverDose = getText (_medicationConfig >> "onOverDose"); };
    };
    if (isNil _onOverDose) then {
        _onOverDose = compile _onOverDose;
    } else {
        _onOverDose = missionNamespace getVariable _onOverDose;
    };
    [_target, _className] call _onOverDose;
};

private _decreaseAmount = 1 / _timeInSystem;
private _viscosityAdjustment = _viscosityChange / _timeInSystem;

// Run the loop that computes the effect of the medication over time
[_target, _variable, 0, _decreaseAmount, _viscosityAdjustment, _painReduce / _timeInSystem] call FUNC(medicationEffectLoop);
