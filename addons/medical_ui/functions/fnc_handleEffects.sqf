/*
 * Author: BaerMitUmlaut
 * Handles any visual effects of medical.
 * Note: Heart beat sounds run in a different PFH - see fnc_effectHeartBeat.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"

if (EGVAR(common,OldIsCamera) || {!alive ACE_player}) exitWith {
    [false, 0] call FUNC(effectUnconscious);
    [false]    call FUNC(effectPain);
    [false]    call FUNC(effectBloodVolume);
    [false]    call FUNC(effectBleeding);
};

// - Current state info -------------------------------------------------------
private _bleedingStrength = [ACE_player] call EFUNC(medical,getBloodloss);
// private _bleeding         = _bleedingStrength > 0;
private _bloodVolume      = ACE_player getVariable [QEGVAR(medical,bloodVolume), DEFAULT_BLOOD_VOLUME];
private _unconscious      = ACE_player getVariable [QEGVAR(medical,isUnconscious), false];
private _heartRate        = ACE_player getVariable [QEGVAR(medical,heartRate), DEFAULT_HEART_RATE];
private _pain             = [ACE_player] call EFUNC(medical,getPainLevel);

if ((!GVAR(heartBeatEffectRunning)) && {_heartRate != 0} && {(_heartRate > 160) || {_heartRate < 60}}) then {
    TRACE_1("Starting heart beat effect",_heartRate);
    GVAR(heartBeatEffectRunning) = true;
    [] call FUNC(effectHeartBeat);
};

// - Visual effects -----------------------------------------------------------
[_unconscious, 2] call FUNC(effectUnconscious);
[
    true, linearConversion [BLOOD_VOLUME_CLASS_2_HEMORRHAGE, BLOOD_VOLUME_CLASS_4_HEMORRHAGE, _bloodVolume, 0, 1, true]
] call FUNC(effectBloodVolume);

if (!_unconscious) then {
    [true, _pain] call FUNC(effectPain);
};

[true, _bleedingStrength] call FUNC(effectBleeding);
