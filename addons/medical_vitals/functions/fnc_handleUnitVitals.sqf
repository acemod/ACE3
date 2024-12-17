#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Updates the vitals. Called from the statemachine's onState functions.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * Update Ran (at least 1 second between runs) <BOOL>
 *
 * Example:
 * [player] call ace_medical_vitals_fnc_handleUnitVitals
 *
 * Public: No
 */

params ["_unit"];

private _lastTimeUpdated = _unit getVariable [QGVAR(lastTimeUpdated), 0];
private _deltaT = (CBA_missionTime - _lastTimeUpdated) min 10;
if (_deltaT < 1) exitWith { false }; // state machines could be calling this very rapidly depending on number of local units

BEGIN_COUNTER(Vitals);

_unit setVariable [QGVAR(lastTimeUpdated), CBA_missionTime];
private _lastTimeValuesSynced = _unit getVariable [QGVAR(lastMomentValuesSynced), 0];
private _syncValues = (CBA_missionTime - _lastTimeValuesSynced) >= (10 + floor(random 10));

if (_syncValues) then {
    _unit setVariable [QGVAR(lastMomentValuesSynced), CBA_missionTime];
};

// Update SPO2 intake and usage since last update
[_unit, _deltaT, _syncValues] call FUNC(updateOxygen);

private _bleeding = -_deltaT * GET_BLOOD_LOSS(_unit);
private _ivChange = [_unit, _deltaT, _syncValues] call FUNC(consumeIVs);

private _bloodVolume = GET_BLOOD_VOLUME(_unit) + _bleeding + _ivChange;
_bloodVolume = 0 max _bloodVolume min DEFAULT_BLOOD_VOLUME;

// @todo: replace this and the rest of the setVariable with EFUNC(common,setApproximateVariablePublic)
_unit setVariable [VAR_BLOOD_VOL, _bloodVolume, _syncValues];

// Handle pain due tourniquets, that have been applied more than 120 s ago
private _tourniquetPain = 0;
private _tourniquets = GET_TOURNIQUETS(_unit);
{
    if (_x > 0 && {CBA_missionTime - _x > 120}) then {
        _tourniquetPain = _tourniquetPain max (CBA_missionTime - _x - 120) * 0.001;
    };
} forEach _tourniquets;
if (_tourniquetPain > 0) then {
    [_unit, _tourniquetPain] call EFUNC(medical_status,adjustPainLevel);
};

// Consume medications
_syncValues = [_unit, _deltaT, _syncValues] call FUNC(consumeMedications);

// Update blood presure
[_unit, _syncValues] call FUNC(updateBloodPressure);

// Consume IVs
[_unit, _deltaT] call FUNC(consumeIVs);

// Update statemachine and status variables
_unit call FUNC(updateState);

END_COUNTER(Vitals);

//placed outside the counter as 3rd-party code may be called from these events
{
    _x call CBA_fnc_localEvent;
} forEach (GVAR(deferredEvents) getOrDefault [_unit, []]);

GVAR(deferredEvents) deleteAt _unit;

[QEGVAR(medical,handleUnitVitals), [_unit, _deltaT]] call CBA_fnc_localEvent;

true
