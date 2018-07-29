/*
 * Author: Glowbal
 * Sets a unit in the unconscious state.
 * For Internal Use: Called from the state machine.
 *
 * Arguments:
 * 0: The unit that will be put in an unconscious state <OBJECT>
 * 1: Set unconsciouns <BOOL>
 *
 * ReturnValue:
 * Success? <BOOLEAN>
 *
 * Example:
 * [bob, true] call ace_medical_fnc_setUnconsciousStatemachine
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_knockOut"];
TRACE_2("setUnconsciousStatemachine",_unit,_knockOut);

if (_knockOut isEqualTo IS_UNCONSCIOUS(_unit)) exitWith {TRACE_1("No Change - Exiting",_knockOut);};

_unit setVariable [VAR_UNCON, _knockOut, true];
["ace_unconscious", [_unit, _knockOut]] call CBA_fnc_globalEvent;
[_unit, _knockOut] call EFUNC(medical_engine,setUnconsciousAnim);


if (_knockOut) then {
    // --- knock out
    if (EGVAR(medical,spontaneousWakeUpChance) > 0) then { // Don't bother setting this if not used
        private _lastWakeUpCheck = CBA_missiontime max (_unit getVariable [QGVAR(lastWakeUpCheck), 0]);
        TRACE_2("setting lastWakeUpCheck",_lastWakeUpCheck,(_lastWakeUpCheck - CBA_missiontime));
        _unit setVariable [QGVAR(lastWakeUpCheck), _lastWakeUpCheck];
    };

    if (_unit == ACE_player) then {
        if (visibleMap) then {openMap false};

        while {dialog} do {
            closeDialog 0;
        };
    };
    [QEGVAR(medical,Unconscious), _unit] call CBA_fnc_localEvent;
} else {
    // --- wake up
    _unit setVariable [QGVAR(lastWakeUpCheck), nil]; // clear this now (min wait time could be set to a very high value)
};
