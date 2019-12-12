#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Handles any visual effects of medical.
 * Note: Heart beat sounds run in a different PFH - see fnc_effectHeartBeat.
 *
 * Arguments:
 * 0: Manual, instant update (optional, default false) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_medical_feedback_fnc_handleEffects
 *
 * Public: No
 */
params [["_manualUpdate", false]];

if (EGVAR(common,OldIsCamera) || {!alive ACE_player}) exitWith {
    [false, 0] call FUNC(effectUnconscious);
    [false]    call FUNC(effectPain);
    [false]    call FUNC(effectBloodVolume);
    [false]    call FUNC(effectBleeding);
};

BEGIN_COUNTER(handleEffects);

// - Current state info -------------------------------------------------------
private _bleedingStrength = GET_BLOOD_LOSS(ACE_player);
private _bloodVolume      = GET_BLOOD_VOLUME(ACE_player);
private _unconscious      = IS_UNCONSCIOUS(ACE_player);
private _heartRate        = GET_HEART_RATE(ACE_player);
private _pain             = GET_PAIN_PERCEIVED(ACE_player);

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

[!_unconscious, _pain] call FUNC(effectPain);
[!_unconscious, _bleedingStrength, _manualUpdate] call FUNC(effectBleeding);

END_COUNTER(handleEffects);
