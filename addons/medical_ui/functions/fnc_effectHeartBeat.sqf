/*
 * Author: BaerMitUmlaut
 * Handles the hear beat sound.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"

private _heartRate = ACE_player getVariable [QEGVAR(medical,heartRate), DEFAULT_HEART_RATE];
if (_heartRate == 0) exitWith {
    TRACE_1("Ending heart beat effect - zero",_heartRate);
    GVAR(heartBeatEffectRunning) = false;
};
private _waitTime  = 60 / _heartRate;

// TRACE_2("",_heartRate,_waitTime);

switch (true) do {
    case (_heartRate > 160): {
        // playSound SND_HEARBEAT_FAST; // Array doesn't blend together well, just play one file consistently
        playSound "ACE_heartbeat_fast_1";
        [DFUNC(effectHeartBeat), [], _waitTime] call CBA_fnc_waitAndExecute;
    };
    case (_heartRate < 60): {
        playSound SND_HEARBEAT_SLOW;
        [DFUNC(effectHeartBeat), [], _waitTime] call CBA_fnc_waitAndExecute;

    };
    default {
        TRACE_1("Ending heart beat effect - normal",_heartRate);
        GVAR(heartBeatEffectRunning) = false;
    };
};
