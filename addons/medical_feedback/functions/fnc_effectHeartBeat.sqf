#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Handles the hear beat sound.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_medical_feedback_fnc_effectHeartBeat
 *
 * Public: No
 */

private _heartRate = GET_HEART_RATE(ACE_player);

if (_heartRate == 0) exitWith {
    TRACE_1("Ending heart beat effect - zero",_heartRate);
    GVAR(heartBeatEffectRunning) = false;
};
private _waitTime  = 60 / _heartRate;

// TRACE_2("",_heartRate,_waitTime);

switch (true) do {
    case (_heartRate > 160): {
        // playSound SND_HEARBEAT_FAST; // Array doesn't blend together well, just play one file consistently
        if (isGameFocused) then { playSound "ACE_heartbeat_fast_1"; };
        [FUNC(effectHeartBeat), [], _waitTime] call CBA_fnc_waitAndExecute;
    };
    case (_heartRate < 60): {
        if (isGameFocused) then { playSound SND_HEARBEAT_SLOW; };
        [FUNC(effectHeartBeat), [], _waitTime] call CBA_fnc_waitAndExecute;
    };
    default {
        TRACE_1("Ending heart beat effect - normal",_heartRate);
        GVAR(heartBeatEffectRunning) = false;
    };
};
