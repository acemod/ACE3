/*
 * Author: Ruthberg
 * Shows the Yardage 450 screen elements
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_yardage450_fnc_acquireTarget
 *
 * Public: No
 */
#include "script_component.hpp"

#define __dsp (uiNamespace getVariable "ACE_RscYardage450")
#define __ctrlTarget (__dsp displayCtrl 720041)
#define __ctrlLaser (__dsp displayCtrl 720042)
#define __ctrlRange (__dsp displayCtrl 720043)
#define __ctrlMeters (__dsp displayCtrl 720044)
#define __ctrlYards (__dsp displayCtrl 720045)

if (currentWeapon ACE_player != "ACE_Yardage450" || cameraView != "GUNNER") exitWith {};

GVAR(powerOnTime) = CBA_missionTime;

if (GVAR(active)) exitWith {};

GVAR(active) = true;

[{
    if (CBA_missionTime - GVAR(powerOnTime) > 30) exitWith {
        GVAR(active) = false;
        74210 cutText ["", "PLAIN"];
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    if (currentWeapon ACE_player == "ACE_Yardage450" && cameraView == "GUNNER") then {
        74210 cutRsc ["ACE_RscYardage450", "PLAIN", 1, false];

        __ctrlLaser ctrlShow GVAR(lasing);
        if (GVAR(targetAcquired)) then {
            __ctrlTarget ctrlSetText "Target Acquired";
            __ctrlRange ctrlSetText GVAR(targetRangeText);
        } else {
            __ctrlTarget ctrlSetText "";
            __ctrlRange ctrlSetText "---";
        };
        __ctrlMeters ctrlShow !GVAR(useYards);
        __ctrlYards ctrlShow GVAR(useYards);
    } else {
        74210 cutText ["", "PLAIN"];
    };

}, 0, []] call CBA_fnc_addPerFrameHandler;
