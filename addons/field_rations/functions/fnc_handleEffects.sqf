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
    {(_thirst > 70) || {_hunger > 70}} && 
    {random 1 < linearConversion [70, 100, _thirst max _hunger, 0.05, 0.2, true]}
) then {
    [ACE_Player, "moan", round (linearConversion [70, 90, _thirst max _hunger, 0, 2, true])] call EFUNC(medical_feedback,playInjuredSound);
};

// Trigger high thirst/hunger consequence
if (
    GETEGVAR(medical,enabled,false) && 
    {(_thirst > 85 || {_hunger > 85})} && 
    {random 1 < linearConversion [85, 100, _thirst max _hunger, 0.05, 0.1, true]}
) exitWith {
    if (XGVAR(nearDepletedConsequence) == 1) then { // Set unit unconscious with a 45s cooldown
        if (CBA_missionTime - XGVAR(lastUnconEvent) > 45) then {
            [_player, true, 5, true] call EFUNC(medical,setUnconscious);
            XGVAR(lastUnconEvent) = CBA_missionTime;
        };
    } else { // Add pain
        if (ACE_Player getVariable [QEGVAR(medical,pain), 0] < 0.1) then {
            [ACE_Player, 0.1] call ace_medical_fnc_adjustPainLevel;
        };
    };
};

// Make unit fall if moving fast
if ((_thirst > 93 || {_hunger > 93}) && {speed _player > 1} && {isNull objectParent _player}) exitWith {
    [_player, "down"] call EFUNC(common,doGesture);
};
