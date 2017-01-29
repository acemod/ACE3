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
if (_heartRate == 0) exitWith {};
private _waitTime  = 60 / _heartRate;

if (CBA_missionTime - GVAR(lastHeartBeatSound) > _waitTime) then {
    GVAR(lastHeartBeatSound) = CBA_missionTime;

    switch (true) do {
        case (_heartRate > 160): {
            playSound SND_HEARBEAT_FAST;
        };
        case (_heartRate < 60): {
            playSound SND_HEARBEAT_SLOW;
        };
    };
};
