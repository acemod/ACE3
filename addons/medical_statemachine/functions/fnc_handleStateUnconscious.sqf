#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Handles the unconscious state
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_medical_statemachine_fnc_handleStateUnconscious
 *
 * Public: No
 */

params ["_unit"];

// If the unit died the loop is finished
if (!alive _unit || {!local _unit}) exitWith {};

[_unit] call EFUNC(medical_vitals,handleUnitVitals);

// Handle spontaneous wake up from unconsciousness
if (EGVAR(medical,spontaneousWakeUpChance) > 0) then {
    if (_unit call EFUNC(medical_status,hasStableVitals)) then {
        private _lastWakeUpCheck = _unit getVariable QEGVAR(medical,lastWakeUpCheck);

        // Handle setting being changed mid-mission and still properly check
        // already unconscious units, should handle locality changes as well
        if (isNil "_lastWakeUpCheck") exitWith {
            TRACE_1("undefined lastWakeUpCheck: setting to current time",_lastWakeUpCheck);
            _unit setVariable [QEGVAR(medical,lastWakeUpCheck), CBA_missionTime];
        };

        private _wakeUpCheckInterval = SPONTANEOUS_WAKE_UP_INTERVAL;
        if (EGVAR(medical,spontaneousWakeUpEpinephrineBoost) > 1) then {
            private _epiEffectiveness = [_unit, "Epinephrine", false] call EFUNC(medical_status,getMedicationCount);
            _wakeUpCheckInterval = _wakeUpCheckInterval * linearConversion [0, 1, _epiEffectiveness, 1, 1 / EGVAR(medical,spontaneousWakeUpEpinephrineBoost), true];
            TRACE_2("epiBoost",_epiEffectiveness,_wakeUpCheckInterval);
        };
        if (CBA_missionTime - _lastWakeUpCheck > _wakeUpCheckInterval) then {
            TRACE_2("Checking for wake up",_unit,EGVAR(medical,spontaneousWakeUpChance));
            _unit setVariable [QEGVAR(medical,lastWakeUpCheck), CBA_missionTime];

            if (random 1 <= EGVAR(medical,spontaneousWakeUpChance)) then {
                TRACE_1("Spontaneous wake up!",_unit);
                [QEGVAR(medical,WakeUp), _unit] call CBA_fnc_localEvent;
            };
        };
    } else {
        // Unstable vitals, procrastinate the next wakeup check
        private _lastWakeUpCheck = _unit getVariable [QEGVAR(medical,lastWakeUpCheck), 0];
        _unit setVariable [QEGVAR(medical,lastWakeUpCheck), _lastWakeUpCheck max CBA_missionTime];
    };
};
