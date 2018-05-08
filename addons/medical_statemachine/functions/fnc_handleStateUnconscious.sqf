
#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_unit", "_stateName"];

// If the unit died the loop is finished
if (!alive _unit) exitWith {};

// If locality changed, broadcast the last medical state and finish the local loop
if (!local _unit) exitWith {
    SET_HEART_RATE(_unit,GET_HEART_RATE(_unit));
    _unit setVariable [QGVAR(bloodPressure), _unit getVariable [QGVAR(bloodPressure), [80, 120]], true];
    _unit setVariable [QGVAR(bloodVolume), _unit getVariable [QGVAR(bloodVolume), DEFAULT_BLOOD_VOLUME], true];
};

[_unit] call EFUNC(medical_vitals,handleUnitVitals);

private _painLevel = GET_PAIN_PERCEIVED(_unit);
if (_painLevel > 0) then {
    [_unit, "moan", PAIN_TO_MOAN(_painLevel)] call EFUNC(medical_engine,playInjuredSound);
};

// Handle spontaneous wakeup from unconsciousness
if (GVAR(spontaneousWakeUpChance) > 0) then {
    if (_unit call EFUNC(medical_status,hasStableVitals)) then {
        private _lastWakeUpCheck = _unit getVariable [QGVAR(lastWakeUpCheck), CBA_missionTime];
        if (CBA_missionTime - _lastWakeUpCheck > SPONTANEOUS_WAKE_UP_INTERVAL) then {
            TRACE_2("Checking for wake up",_unit,GVAR(spontaneousWakeUpChance));
            _unit setVariable [QGVAR(lastWakeUpCheck), CBA_missionTime];
            if ((random 1) < GVAR(spontaneousWakeUpChance)) then {
                TRACE_1("Spontaneous wake up!",_unit);
                [QGVAR(WakeUp), _unit] call CBA_fnc_localEvent;
            };
        };
    } else {
        // Unstable vitals, procrastinate the next wakeup check
        _unit setVariable [QGVAR(lastWakeUpCheck), CBA_missionTime];
    };
};
