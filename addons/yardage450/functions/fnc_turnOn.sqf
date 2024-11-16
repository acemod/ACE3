#include "..\script_component.hpp"
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
 * call ace_yardage450_fnc_turnOn
 *
 * Public: No
 */

#define DISPLAY_YARDAGE (uiNamespace getVariable "ACE_RscYardage450")
#define CTRL_TARGET (DISPLAY_YARDAGE displayCtrl 720041)
#define CTRL_LASER (DISPLAY_YARDAGE displayCtrl 720042)
#define CTRL_RANGE (DISPLAY_YARDAGE displayCtrl 720043)
#define CTRL_METERS (DISPLAY_YARDAGE displayCtrl 720044)
#define CTRL_YARDS (DISPLAY_YARDAGE displayCtrl 720045)

if (currentWeapon ACE_player != "ACE_Yardage450" || cameraView != "GUNNER") exitWith {};

GVAR(powerOnTime) = CBA_missionTime;

if (GVAR(active)) exitWith {};

GVAR(active) = true;

[{
    if (CBA_missionTime - GVAR(powerOnTime) > 30) exitWith {
        GVAR(active) = false;
        QUOTE(ADDON) cutText ["", "PLAIN"];
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    if (currentWeapon ACE_player == "ACE_Yardage450" && cameraView == "GUNNER") then {
        if (isNil {DISPLAY_YARDAGE} || {isNull DISPLAY_YARDAGE} || {ctrlIDD DISPLAY_YARDAGE != -1}) then {
            TRACE_1("making display",DISPLAY_YARDAGE);
            QUOTE(ADDON) cutRsc ["ACE_RscYardage450", "PLAIN", 1, false];
        };

        CTRL_LASER ctrlShow GVAR(lasing);
        if (GVAR(targetAcquired)) then {
            CTRL_TARGET ctrlSetText "Target Acquired";
            CTRL_RANGE ctrlSetText GVAR(targetRangeText);
        } else {
            CTRL_TARGET ctrlSetText "";
            CTRL_RANGE ctrlSetText "---";
        };
        CTRL_METERS ctrlShow !GVAR(useYards);
        CTRL_YARDS ctrlShow GVAR(useYards);
    } else {
        QUOTE(ADDON) cutText ["", "PLAIN"];
    };

}, 0, []] call CBA_fnc_addPerFrameHandler;
