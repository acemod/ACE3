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
if (_heartRate == 0) exitWith {GVAR(heartBeatEffectRunning) = false;};

private _waitTime  = 60 / _heartRate;

switch (true) do {
    case (_heartRate > 160): {
        playSound SND_HEARBEAT_FAST;
        [DFUNC(effectHeartBeat), [], _waitTime] call CBA_fnc_waitAndExecute;
    };
    case (_heartRate < 60): {
        playSound SND_HEARBEAT_SLOW;
        [DFUNC(effectHeartBeat), [], _waitTime] call CBA_fnc_waitAndExecute;

    };
    default {
        TRACE_1("Ending heart beat effect",_heartRate);
        GVAR(heartBeatEffectRunning) = false;
    };
};
