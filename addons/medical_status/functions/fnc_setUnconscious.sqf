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
 * Public: No
 */

params ["_unit", "_active"];

// No change to make
if (_active isEqualTo IS_UNCONSCIOUS(_unit)) exitWith {};

_unit setVariable [VAR_UNCON, _active, true];

// Toggle unit ragdoll state
[_unit, _active] call EFUNC(medical_engine,setUnconsciousAnim);

if (_active) then {
    // Don't bother setting this if not used
    if (EGVAR(medical,spontaneousWakeUpChance) > 0) then {
        _unit setVariable [QGVAR(lastWakeUpCheck), CBA_missiontime];
    };

    if (_unit == ACE_player) then {
        if (visibleMap) then {openMap false};

        while {dialog} do {
            closeDialog 0;
        };
    };
} else {
    // Unit has woken up, no longer need to track this
    _unit setVariable [QGVAR(lastWakeUpCheck), nil];
};

// This event doesn't correspond to unconscious in statemachine
// It's for any time a unit changes consciousness (including cardiac arrest)
["ace_unconscious", [_unit, _active]] call CBA_fnc_globalEvent;
