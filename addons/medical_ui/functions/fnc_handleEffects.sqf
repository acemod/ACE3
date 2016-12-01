/*
 * Author: BaerMitUmlaut
 * Handles any audible and visual effects of medical.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"

private _disableAll = (!isNull curatorCamera) || {!alive ACE_player};
if (_disableAll) exitWith {
    [false, false] call FUNC(effectUnconscious);
    [false]        call FUNC(effectPain);
    [false]        call FUNC(effectBloodVolume);
};

// - Current state info -------------------------------------------------------
private _bleedingStrength = [ACE_player] call EFUNC(medical,getBloodloss);
private _bleeding         = _bleedingStrength > 0;
private _bloodVolume      = ACE_player getVariable [QEGVAR(medical,bloodVolume), 1];
private _unconscious      = ACE_player getVariable [QEGVAR(medical,isUnconscious), false];
private _heartRate        = ACE_player getVariable [QEGVAR(medical,heartRate), 70];
private _pain             = ACE_player getVariable [QEGVAR(medical,pain), 0];

// - Visual effects -----------------------------------------------------------
[_unconscious, _unconscious && true    ] call FUNC(effectUnconscious);
[true,         _pain                   ] call FUNC(effectPain);
[true,         (6 - _bloodVolume) max 0] call FUNC(effectBloodVolume);
