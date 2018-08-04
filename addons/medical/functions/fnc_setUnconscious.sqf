#include "script_component.hpp"
/*
 * Author: Glowbal
 * Sets a unit in the unconscious state.
 * For Public Use
 *
 * Arguments:
 * 0: The unit that will be put in an unconscious state <OBJECT>
 * 1: Set unconsciouns <BOOL> (default: true)
 * 2: Minimum unconscious time (set to 0 to ignore) <NUMBER><OPTIONAL> (default: 0)
 * 3: Force wakeup at given time if vitals are stable <BOOL><OPTIONAL> (default: false)
 *
 * Return Value:
 * Success? <BOOLEAN>
 *
 * Example:
 * [bob, true] call ace_medical_status__fnc_setUnconscious;
 * [player, true, 5, true] call ace_medical_status_fnc_setUnconscious;
 *
 * Public: yes
 */
// #define DEBUG_MODE_FULL

// only run this after the settings are initialized
if !(EGVAR(common,settingsInitFinished)) exitWith {
    EGVAR(common,runAtSettingsInitialized) pushBack [FUNC(setUnconscious), _this];
};

params ["_unit", ["_knockOut", true, [false]], ["_minWaitingTime", 0, [0]], ["_forcedWakup", false, [false]]];
TRACE_4("setUnconscious",_unit,_knockOut,_minWaitingTime,_forcedWakup);

if ((isNull _unit) || {!alive _unit} || {!(_unit isKindOf "CAManBase")}) exitWith {
    ERROR_3("Bad Unit %1 [Type: %2] [Alive: %3]",_unit,typeOf _unit,alive _unit);
    false
};
if (!local _unit) exitWith {
    [QEGVAR(medical,setUnconscious), [_unit, _knockOut], _unit] call CBA_fnc_targetEvent;
    true
};
if (_knockOut isEqualTo IS_UNCONSCIOUS(_unit)) exitWith {
    WARNING_2("setUnconscious called with no change [Unit %1] [State [%2]", _unit, _knockOut);
    false
};

private _beforeState = [_unit, EGVAR(medical,STATE_MACHINE)] call CBA_statemachine_fnc_getCurrentState;


if (_knockOut) then {
    if (_minWaitingTime > 0) then {
        if (_forcedWakup) then {
            // If unit still has stable vitals at min waiting time, then force wake up
            [{
                params [["_unit", objNull]];
                if ((alive _unit) && {_unit call FUNC(hasStableVitals)}) then {
                    TRACE_1("Doing delay wakeup",_unit);
                    [QGVAR(WakeUp), _unit] call CBA_fnc_localEvent;
                } else {
                    TRACE_1("Skipping delay wakeup",_unit);
                };
            }, [_unit], _minWaitingTime] call CBA_fnc_waitAndExecute;
        };
        if (EGVAR(medical,spontaneousWakeUpChance) > 0) then {
            _unit setVariable [QEGVAR(medical,lastWakeUpCheck), CBA_missionTime + _minWaitingTime - SPONTANEOUS_WAKE_UP_INTERVAL];
        };
    };

    [QGVAR(knockOut), _unit] call CBA_fnc_localEvent;
} else {
    [QGVAR(WakeUp), _unit] call CBA_fnc_localEvent;
};

true
