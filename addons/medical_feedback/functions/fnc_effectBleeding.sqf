#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Handles the bleeding effect.
 *
 * Arguments:
 * 0: Enable effect <BOOL>
 * 1: Current bloodloss (in l/s) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [false, 0.5] call ace_medical_feedback_fnc_effectBleeding
 *
 * Public: No
 */

params ["_enable", "_bloodloss"];
if (isNull findDisplay 46) exitWith {};

private _controls = uiNamespace getVariable [QGVAR(bloodControls), [controlNull, controlNull]];
_controls params ["_blood1", "_blood2"];

if (!_enable) exitWith {
    _blood1 ctrlSetFade 1;
    _blood2 ctrlSetFade 1;

    _blood1 ctrlCommit 0;
    _blood2 ctrlCommit 0;
};

// Initialize controls
if (isNull _blood1) then {
    TRACE_1("Creating Blood Controls",_controls);
    _blood1 = findDisplay 46 ctrlCreate ["RscPicture", -1];
    _blood2 = findDisplay 46 ctrlCreate ["RscPicture", -1];

    _blood1 ctrlSetText QPATHTOF(data\blood1.paa);
    _blood2 ctrlSetText QPATHTOF(data\blood2.paa);

    private _pos = [safeZoneXAbs, safeZoneY, safeZoneWAbs, safeZoneH];
    _blood1 ctrlSetPosition _pos;
    _blood2 ctrlSetPosition _pos;

    _blood1 ctrlSetFade 1;
    _blood2 ctrlSetFade 1;

    _blood1 ctrlCommit 0;
    _blood2 ctrlCommit 0;

    uiNamespace setVariable [QGVAR(bloodControls), [_blood1, _blood2]];
};

private _fade = linearConversion [0, 0.002, _bloodloss, 1, 0, true];

private _switchBloodFadeInfo = missionNamespace getVariable [QGVAR(switchBloodFadeInfo), [0, 0]];
_switchBloodFadeInfo params ["_tickCounter", "_lastBloodloss"];

if (_tickCounter == 2) then {
    if (ctrlFade _blood1 > ctrlFade _blood2) then {
        _blood1 ctrlSetFade _fade;
        _blood2 ctrlSetFade 1;
    } else {
        _blood1 ctrlSetFade 1;
        _blood2 ctrlSetFade _fade;
    };

    _blood1 ctrlCommit 3;
    _blood2 ctrlCommit 3;

    GVAR(switchBloodFadeInfo) = [0, _bloodloss];
} else {
    GVAR(switchBloodFadeInfo) = [_tickCounter + 1, _bloodloss];
};

// Speed up fade on sudden changes
if (abs (_lastBloodloss - _bloodloss) > 0.001) then {
    _blood1 ctrlCommit 1;
    _blood2 ctrlCommit 1;
};
