#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Handles locality switch. Will also be called at unit init.
 * Because state machine state is local only, when a unit transfers locality we need to manually transition to it's current state
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: isLocal <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, true] call ace_medical_statemachine_fnc_localityChangedEH
 *
 * Public: No
 */

params ["_unit", "_isLocal"];
TRACE_2("localityChangedEH",_unit,_isLocal);

if (!alive _unit) exitWith {};

if (_isLocal) then {
    private _currentState = [_unit, EGVAR(medical,STATE_MACHINE)] call CBA_statemachine_fnc_getCurrentState;
    TRACE_1("local",_currentState);

    switch (true) do {
        case (IN_CRDC_ARRST(_unit)): {
            if (_currentState == "CardiacArrest") exitWith {};
            _unit setVariable [VAR_CRDC_ARRST, false]; // force reset vars so setCardiacArrestState can run (enteredStateCardiacArrest will also be called)
            _unit setVariable [VAR_UNCON, false];
            TRACE_1("manually changing state to CardiacArrest",_currentState);
            [_unit, EGVAR(medical,STATE_MACHINE), _currentState, "CardiacArrest", {}, "LocalityChange"] call CBA_statemachine_fnc_manualTransition;
        };
        case (IS_UNCONSCIOUS(_unit)): {
            if (_currentState == "Unconscious") exitWith {};
            _unit setVariable [VAR_UNCON, false]; // force reset var so ace_medical_status_fnc_setUnconsciousState can run
            TRACE_1("manually changing state to Unconscious",_currentState);
            [_unit, EGVAR(medical,STATE_MACHINE), _currentState, "Unconscious", {}, "LocalityChange"] call CBA_statemachine_fnc_manualTransition;
        };
        case (IS_BLEEDING(_unit) || {IS_IN_PAIN(_unit)}): {
            if (_currentState == "Injured") exitWith {};
            TRACE_1("manually changing state to Injured",_currentState);
            [_unit, EGVAR(medical,STATE_MACHINE), _currentState, "Injured", {}, "LocalityChange"] call CBA_statemachine_fnc_manualTransition;
        };
        default {
            // If locality transfers back and forth, we could be in an old state and should transfer back to default
            if (_currentState == "Default") exitWith {};
            TRACE_1("manually changing state to Default",_currentState);
            [_unit, EGVAR(medical,STATE_MACHINE), _currentState, "Default", {}, "LocalityChange"] call CBA_statemachine_fnc_manualTransition;
        };
    };
} else {
    /*
    // Not sure if this is even needed, idea is that on locality transfer we broadcast more up to date info

    private _lastTimeUpdated = _unit getVariable [QEGVAR(medical_vitals,lastTimeUpdated), 1e99];
    private _deltaT = CBA_missionTime - _lastTimeUpdated;
    TRACE_1("not local",_deltaT);
    if (_deltaT < 5) then {
        // If locality changed and we have recently updated vitals, broadcast globally now
        _unit setVariable [VAR_HEART_RATE, GET_HEART_RATE(_unit), true];
        _unit setVariable [VAR_BLOOD_PRESS, _unit getVariable [VAR_BLOOD_PRESS, [80, 120]], true];
        _unit setVariable [VAR_BLOOD_VOL, GET_BLOOD_VOLUME(_unit), true];
    };
    */
};
