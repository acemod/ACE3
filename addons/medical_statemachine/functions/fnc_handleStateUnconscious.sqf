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
if (!alive _unit) exitWith {};
if (!local _unit) exitWith {};

[_unit] call EFUNC(medical_vitals,handleUnitVitals);

private _painLevel = GET_PAIN_PERCEIVED(_unit);
if (_painLevel > 0) then {
    [QEGVAR(medical,moan), [_unit, _painLevel]] call CBA_fnc_localEvent;
};

// Handle spontaneous wakeup from unconsciousness
if (EGVAR(medical,spontaneousWakeUpChance) > 0) then {
    if (_unit call EFUNC(medical_status,hasStableVitals)) then {
        private _lastWakeUpCheck = _unit getVariable [QEGVAR(medical,lastWakeUpCheck), CBA_missionTime];
        if (CBA_missionTime - _lastWakeUpCheck > SPONTANEOUS_WAKE_UP_INTERVAL) then {
            TRACE_2("Checking for wake up",_unit,EGVAR(medical,spontaneousWakeUpChance));
            _unit setVariable [QEGVAR(medical,lastWakeUpCheck), CBA_missionTime];
            if ((random 1) < EGVAR(medical,spontaneousWakeUpChance)) then {
                TRACE_1("Spontaneous wake up!",_unit);
                [QEGVAR(medical,WakeUp), _unit] call CBA_fnc_localEvent;
            };
        };
    } else {
        // Unstable vitals, procrastinate the next wakeup check
        _unit setVariable [QEGVAR(medical,lastWakeUpCheck), CBA_missionTime];
    };
};
