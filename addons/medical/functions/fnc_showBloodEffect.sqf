/*
 * Author: KoffeinFlummi, Glowbal
 * Does the blood screen effect, just like BIS_fnc_bloodeffect, but in non-sheduled environment.
 *
 * Arguments:
 * 0: Effect multiplier <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [2] call ace_medical_fnc_showBloodEffect
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_bloodRemaining"];

disableSerialization;

// get already existing controls, or create them

private _fxBloodControls = GETUVAR(GVAR(FXBloodControls),[]);

private _bloodCtrl1 = controlNull;
private _bloodCtrl2 = controlNull;
private _bloodCtrl3 = controlNull;
if (count _fxBloodControls != 3) then {
    _bloodCtrl1 = findDisplay 46 ctrlCreate ["RscPicture", -1];
    _bloodCtrl2 = findDisplay 46 ctrlCreate ["RscPicture", -1];
    _bloodCtrl3 = findDisplay 46 ctrlCreate ["RscPicture", -1];

    // set their textures, screen position etc.
    _bloodCtrl1 ctrlSetText "A3\Ui_f\data\igui\rsctitles\HealthTextures\blood_lower_ca.paa";
    _bloodCtrl2 ctrlSetText "A3\Ui_f\data\igui\rsctitles\HealthTextures\blood_middle_ca.paa";
    _bloodCtrl3 ctrlSetText "A3\Ui_f\data\igui\rsctitles\HealthTextures\blood_upper_ca.paa";

    // positions are from config
    private _ctrlPosition = [
        ((0 * safezoneW) + safezoneX) + ((safezoneW - (2.125 * safezoneW * 3/4)) / 2),
        (-0.0625 * safezoneH) + safezoneY,
        2.125 * safezoneW * 3/4,
        1.125 * safezoneH
    ];

    _bloodCtrl1 ctrlSetPosition _ctrlPosition;
    _bloodCtrl2 ctrlSetPosition _ctrlPosition;
    _bloodCtrl3 ctrlSetPosition _ctrlPosition;

    _fxBloodControls = [_bloodCtrl1, _bloodCtrl2, _bloodCtrl3];
    SETUVAR(GVAR(FXBloodControls),_fxBloodControls);
} else {
    _bloodCtrl1 = _fxBloodControls select 0;
    _bloodCtrl2 = _fxBloodControls select 1;
    _bloodCtrl3 = _fxBloodControls select 2;
};

// reset everything
_bloodCtrl1 ctrlSetFade 1;
_bloodCtrl2 ctrlSetFade 1;
_bloodCtrl3 ctrlSetFade 1;

_bloodCtrl1 ctrlCommit 0;
_bloodCtrl2 ctrlCommit 0;
_bloodCtrl3 ctrlCommit 0;

if (_bloodRemaining < 5) exitWith {
    // nothing
};

if (_bloodRemaining < 25) exitWith {
    _bloodCtrl1 ctrlSetFade 0.2;
    _bloodCtrl1 ctrlCommit 0.2;

    [{
        (_this select 0) ctrlSetFade 1;
        (_this select 0) ctrlCommit 0.8;
    }, _fxBloodControls, 0.7] call CBA_fnc_waitAndExecute;
};

if (_bloodRemaining < 40) exitWith {
    _bloodCtrl1 ctrlSetFade 0.2;
    _bloodCtrl2 ctrlSetFade 0.85;
    _bloodCtrl1 ctrlCommit 0.2;
    _bloodCtrl2 ctrlCommit 0.2;

    [{
        (_this select 0) ctrlSetFade 1;
        (_this select 1) ctrlSetFade 1;
        (_this select 1) ctrlCommit 1;
    }, _fxBloodControls, 0.7] call CBA_fnc_waitAndExecute;

    [{
        (_this select 0) ctrlCommit 0.8;
    }, _fxBloodControls, 1.2] call CBA_fnc_waitAndExecute;
};

if (_bloodRemaining < 55) exitWith {
    _bloodCtrl1 ctrlSetFade 0.2;
    _bloodCtrl2 ctrlSetFade 0.7;
    _bloodCtrl1 ctrlCommit 0.2;
    _bloodCtrl2 ctrlCommit 0.2;

    [{
        (_this select 0) ctrlSetFade 1;
        (_this select 1) ctrlSetFade 1;
        (_this select 2) ctrlSetFade 1;
        (_this select 1) ctrlCommit 1;
    }, _fxBloodControls, 0.7] call CBA_fnc_waitAndExecute;

    [{
        (_this select 0) ctrlCommit 0.8;
    }, _fxBloodControls, 1.2] call CBA_fnc_waitAndExecute;
};

if (_bloodRemaining < 70) exitWith {
    _bloodCtrl1 ctrlSetFade 0.2;
    _bloodCtrl2 ctrlSetFade 0.7;
    _bloodCtrl3 ctrlSetFade 0.85;
    _bloodCtrl1 ctrlCommit 0.2;
    _bloodCtrl2 ctrlCommit 0.2;
    _bloodCtrl3 ctrlCommit 0.2;

    [{
        (_this select 0) ctrlSetFade 1;
        (_this select 1) ctrlSetFade 1;
        (_this select 2) ctrlSetFade 1;
        (_this select 2) ctrlCommit 1.5;
    }, _fxBloodControls, 0.7] call CBA_fnc_waitAndExecute;

    [{
        (_this select 1) ctrlCommit 1;
    }, _fxBloodControls, 1.7] call CBA_fnc_waitAndExecute;

    [{
        (_this select 0) ctrlCommit 0.8;
    }, _fxBloodControls, 2.2] call CBA_fnc_waitAndExecute;
};

//default
_bloodCtrl1 ctrlSetFade 0.2;
_bloodCtrl2 ctrlSetFade 0.7;
_bloodCtrl3 ctrlSetFade 0.7;
_bloodCtrl1 ctrlCommit 0.2;
_bloodCtrl2 ctrlCommit 0.2;
_bloodCtrl3 ctrlCommit 0.2;

[{
    (_this select 0) ctrlSetFade 1;
    (_this select 1) ctrlSetFade 1;
    (_this select 2) ctrlSetFade 1;
    (_this select 2) ctrlCommit 1.5;
}, _fxBloodControls, 0.7] call CBA_fnc_waitAndExecute;

[{
    (_this select 1) ctrlCommit 1;
}, _fxBloodControls, 1.7] call CBA_fnc_waitAndExecute;

[{
    (_this select 0) ctrlCommit 0.8;
}, _fxBloodControls, 2.2] call CBA_fnc_waitAndExecute;
