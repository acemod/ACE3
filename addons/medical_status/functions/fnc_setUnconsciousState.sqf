#include "script_component.hpp"
/*
 * Author: Glowbal
 * Sets a unit in the unconscious state.
 * For Internal Use: Called from the state machine.
 *
 * Arguments:
 * 0: The unit that will be put in an unconscious state <OBJECT>
 * 1: Set unconscious <BOOL>
 *
 * Return Value:
 * Success <BOOL>
 *
 * Example:
 * [player, true] call ace_medical_status_fnc_setUnconsciousState
 *
 * Public: No
 */

params ["_unit", "_active"];
TRACE_2("setUnconsciousState",_unit,_active);

// No change to make
if (_active isEqualTo IS_UNCONSCIOUS(_unit)) exitWith { TRACE_2("no change",_active,IS_UNCONSCIOUS(_unit)); };

_unit setVariable [VAR_UNCON, _active, true];

// Toggle unit ragdoll state
[_unit, _active] call EFUNC(medical_engine,setUnconsciousAnim);

// Stop AI firing at unconscious units in most situations (global effect)
[_unit, "setHidden", "ace_unconscious", _active] call EFUNC(common,statusEffect_set);

if (_active) then {
    // Don't bother setting this if not used
    if (EGVAR(medical,spontaneousWakeUpChance) > 0) then {
        private _lastWakeUpCheck = _unit getVariable [QEGVAR(medical,lastWakeUpCheck), 0]; // could be set higher from ace_medical_fnc_setUnconscious
        TRACE_2("setting lastWakeUpCheck to max of",_lastWakeUpCheck,CBA_missionTime);
        _unit setVariable [QEGVAR(medical,lastWakeUpCheck), _lastWakeUpCheck max CBA_missionTime];
    };

    if (_unit == ACE_player) then {
        if (visibleMap) then {openMap false};

        while {dialog} do {
            closeDialog 0;
        };
    };
} else {
    // Unit has woken up, no longer need to track this
    _unit setVariable [QEGVAR(medical,lastWakeUpCheck), nil];
};

// This event doesn't correspond to unconscious in statemachine
// It's for any time a unit changes consciousness (including cardiac arrest)
["ace_unconscious", [_unit, _active]] call CBA_fnc_globalEvent;
