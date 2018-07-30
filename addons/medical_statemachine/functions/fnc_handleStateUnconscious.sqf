#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 *
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_unit"];

// If the unit died the loop is finished
if (!alive _unit) exitWith {};

// If locality changed, broadcast the last medical state and finish the local loop
if (!local _unit) exitWith {
    _unit setVariable [VAR_HEART_RATE, GET_HEART_RATE(_unit), true];
    _unit setVariable [VAR_BLOOD_PRESS, _unit getVariable [VAR_BLOOD_PRESS, [80, 120]], true];
    _unit setVariable [VAR_BLOOD_VOL, GET_BLOOD_VOLUME(_unit), true];
};

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
