#include "..\script_component.hpp"
/*
 * Author: mharis001, Glowbal, PabstMirror
 * Handles the effects/consequences of high thirst/hunger.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Thirst <NUMBER>
 * 2: Hunger <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player, _thirst, _hunger] call ace_field_rations_fnc_handleEffects
 *
 * Public: No
 */

params ["_player", "_thirst", "_hunger"];

// Kill unit with max thirst or hunger
if ((_thirst > 99.9 || {_hunger > 99.9}) && {random 1 < 0.5}) exitWith {
    [_player, "Hunger/Thirst empty"] call EFUNC(common,setDead);
};

// Exit if unit is not awake, below are animation based consequences
if !(_player call EFUNC(common,isAwake)) exitWith {};

// Make unit moan from high hunger/thirst
if (
    GETEGVAR(medical,enabled,false) && 
    {(_thirst > CONSEQ_THRESHOLD_LIGHT) || {_hunger > CONSEQ_THRESHOLD_LIGHT}} && 
    {random 1 < linearConversion [CONSEQ_THRESHOLD_LIGHT, 100, (_thirst max _hunger), 0.05, 0.2, true]}
) then {
    [ACE_Player, "moan", round (linearConversion [CONSEQ_THRESHOLD_LIGHT, 90, (_thirst max _hunger), 0, 2, true])] call EFUNC(medical_feedback,playInjuredSound);
};

// Trigger high thirst/hunger consequence (chance based on how high thirst/hunger are)
if (
    GETEGVAR(medical,enabled,false) && 
    {(_thirst > CONSEQ_THRESHOLD_SEVERE || {_hunger > CONSEQ_THRESHOLD_SEVERE}) && 
    {random 1 < linearConversion [CONSEQ_THRESHOLD_SEVERE, 100, _thirst max _hunger, 0.05, 0.1, true]}}
) exitWith {
    if (XGVAR(nearDepletedConsequence) == 1) then { // Set unit unconscious with a 45s cooldown
        if (_player getVariable [QGVAR(nextUnconsciousTime), CBA_missionTime] >= CBA_missionTime) then {
            _player setVariable [QGVAR(nextUnconsciousTime), CBA_missionTime + 45];
            [_player, true, 5, true] call EFUNC(medical,setUnconscious);
        };
    } else { // Add pain
        if (ACE_Player getVariable [QEGVAR(medical,pain), 0] < 0.1) then {
            [ACE_Player, 0.1] call EFUNC(medical,adjustPainLevel);
        };
    };
};

// Make unit fall if moving fast
if ((_thirst > 93 || {_hunger > 93}) && {speed _player > 1} && {isNull objectParent _player}) exitWith {
    [_player, "down"] call EFUNC(common,doGesture);
};
