#include "..\script_component.hpp"
/*
 * Author: BrettMayson
 * Per Frame Handler that updates smoke effects on units
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Nothing <NOTHING>
 *
 * Example:
 * [{
 *   [player] call ace_smoke_fnc_pfh
 * }] call CBA_fnc_addPerFrameHandler
 *
 * Public: No
 */

params ["_unit"];

private _isInSmoke = [_unit] call FUNC(isInSmoke);

private _change = (if (_isInSmoke) then {
    0.175 * GVAR(effectFactor)
} else {
    -0.04 * GVAR(recoveryFactor)
}) * diag_deltaTime;

// Eyes
private _levelEyes = _unit getVariable [QGVAR(eyesLevel), 0];
private _newLevelEyes = _levelEyes + _change;
_newLevelEyes = _newLevelEyes min 1;
_newLevelEyes = _newLevelEyes max 0;
_levelEyes = _newLevelEyes;

private _eyesProtect = _unit getVariable [QGVAR(eyesProtection), 0];
if (_eyesProtect != 0) then {
    _levelEyes = _levelEyes * (1 - _eyesProtect);
};
_unit setVariable [QGVAR(eyesLevel), _levelEyes];

private _dynamicBlurValue = linearConversion [0.2, 1, _levelEyes, 0, 0.8, true];
private _colorCorrectionsValue = linearConversion [0.2, 1, _levelEyes, 1, 0.6, true];

if (_unit == ace_player) then {
    GVAR(ppHandleDynamicBlur) ppEffectAdjust [_dynamicBlurValue];
    GVAR(ppHandleColorCorrections) ppEffectAdjust [1,1,0,[0,0,0,0],[0.8, 0.8, 0.8, _colorCorrectionsValue],[1,1,1,0]];

    GVAR(ppHandleDynamicBlur) ppEffectCommit 0;
    GVAR(ppHandleColorCorrections) ppEffectCommit 0;
};

// Breathing
private _levelBreathing = _unit getVariable [QGVAR(breathingLevel), 0];
private _newLevelBreathing = _levelBreathing + _change;
_newLevelBreathing = _newLevelBreathing min 1;
_newLevelBreathing = _newLevelBreathing max 0;
_levelBreathing = _newLevelBreathing;

private _breathProtect = _unit getVariable [QGVAR(breathingProtection), 0];
if (_breathProtect != 0) then {
    _levelBreathing = _levelBreathing * (1 - _breathProtect);
};
_unit setVariable [QGVAR(breathingLevel), _levelBreathing];

private _breathingEffectiveness = linearConversion [0.2, 1, _levelBreathing, 1, 0.6, true];
if !(isNil "ace_medical_vitals_fnc_addSpO2DutyFactor") then {
    [QUOTE(ADDON), _breathingEffectiveness] call ace_medical_vitals_fnc_addSpO2DutyFactor;
};

// Event
private _smoked = _unit getVariable [QGVAR(smoked), false];
if (_isInSmoke != _smoked) then {
    _unit setVariable [QGVAR(smoked), _isInSmoke, true];
    [QGVAR(smoked), _isInSmoke] call CBA_fnc_localEvent;
};
