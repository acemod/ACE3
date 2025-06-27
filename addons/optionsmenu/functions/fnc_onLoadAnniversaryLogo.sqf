#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Shows the 10 year anniversary logo in the main menu.
 *
 * Arguments:
 * 0: Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ACE_optionsmenu_fnc_onLoadAnniversaryLogo
 *
 * Public: No
 */

params ["_ctrl"];

if (systemTime#0 == 2025 && {systemTime#1 == 4} && {systemTime#2 <= 10}) then {
    private _display = ctrlParent _ctrl;

    // Hide default logo
    {
        if (ctrlClassName _x == "Logo" || {ctrlClassName _x == "LogoApex"}) then {
            _x ctrlShow false;
        };
    } forEach allControls _display;

    // Setup contributors control
    private _textCtrl = _display displayCtrl 13502;
    _textCtrl ctrlSetFade 1;
    _textCtrl ctrlCommit 0;

    // Hack because EachFrame gets cleared after onLoad
    _display displayAddEventHandler ["MouseMoving", {
        params ["_display"];
        _display displayRemoveEventHandler ["MouseMoving", _thisEventHandler];

        private _textCtrl = _display displayCtrl 13501;
        private _contributorCtrl = _display displayCtrl 13502;
        GVAR(fadeNextTick) = diag_tickTime;

        // Contributor fade loop
        addMissionEventHandler ["EachFrame", {
            _thisArgs params ["_contributorCtrl", "_textCtrl"];

            if (isNull _contributorCtrl || {!ctrlShown _contributorCtrl}) exitWith {
                removeMissionEventHandler ["EachFrame", _thisEventHandler];
            };

            if (GVAR(fadeNextTick) > diag_tickTime) exitWith {};

            if (ctrlFade _contributorCtrl == 1) then {
                _textCtrl ctrlSetText selectRandom [
                    "Made with blood and sweat by",
                    "Made with <3 by",
                    "Made with passion and purpose by",
                    "Crafted with care and creativity by",
                    "Built with dreams and determination by",
                    "Designed with love and laughter by",
                    "Created with grit and grace by",
                    "Forged with heart and hustle by",
                    "Produced with inspiration and innovation by",
                    "Assembled with joy and journey by",
                    "Developed with skill and soul by"
                ];
                _contributorCtrl ctrlSetText selectRandom [
                    #include "contributorNames.inc.sqf"
                ];

                _contributorCtrl ctrlSetFade 0;
                _contributorCtrl ctrlCommit 0.5;
                GVAR(fadeNextTick) = diag_tickTime + 5.5;
            } else {
                _contributorCtrl ctrlSetFade 1;
                _contributorCtrl ctrlCommit 0.2;
                GVAR(fadeNextTick) = diag_tickTime + 0.3;
            };
        }, [_contributorCtrl, _textCtrl]];
    }];
} else {
    _ctrl ctrlShow false;
    (ctrlParent _ctrl displayCtrl 13501) ctrlShow false;
    (ctrlParent _ctrl displayCtrl 13502) ctrlShow false;
};
