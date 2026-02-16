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

if (isGamePaused) exitWith {};

#define EFFECT_RATE 0.3
#define RECOVERY_RATE -0.075

private _isInSmoke = [_unit] call FUNC(isInSmoke);

private _change = (if (_isInSmoke) then {
    EFFECT_RATE * GVAR(effectFactor)
} else {
    RECOVERY_RATE * GVAR(recoveryFactor)
}) * PFH_INTERVAL;

private _fnc_updateLevel = {
    params ["_level", "_protect"];
    private _innerChange = if (_protect == 1 && _isInSmoke) then {
        RECOVERY_RATE * GVAR(recoveryFactor) * PFH_INTERVAL
    } else {
        _change
    };
    private _newLevel = (_level + _innerChange) min 1 max 0;
    if (_protect != 0 && _protect != 1) then {
        _newLevel = _newLevel * (1 - _protect);
    };
    _newLevel
};

// Eyes
private _levelEyes = _unit getVariable [QGVAR(eyesLevel), 0];
private _eyesProtect = _unit getVariable [QGVAR(eyesProtection), 0];
_levelEyes = [_levelEyes, _eyesProtect] call _fnc_updateLevel;
_unit setVariable [QGVAR(eyesLevel), _levelEyes];

private _dynamicBlurValue = linearConversion [0.05, 1, _levelEyes, 0, 0.8, true];
private _colorCorrectionsValue = linearConversion [0.05, 1, _levelEyes, 1, 0.6, true];

if (_unit == ace_player) then {
    GVAR(ppHandleDynamicBlur) ppEffectAdjust [_dynamicBlurValue];
    GVAR(ppHandleColorCorrections) ppEffectAdjust [1,1,0,[0,0,0,0],[0.8, 0.8, 0.8, _colorCorrectionsValue],[1,1,1,0]];

    GVAR(ppHandleDynamicBlur) ppEffectCommit PFH_INTERVAL;
    GVAR(ppHandleColorCorrections) ppEffectCommit PFH_INTERVAL;
};

// Breathing
private _levelBreathing = _unit getVariable [QGVAR(breathingLevel), 0];
private _breathProtect = _unit getVariable [QGVAR(breathingProtection), 0];
_levelBreathing = [_levelBreathing, _breathProtect] call _fnc_updateLevel;
_unit setVariable [QGVAR(breathingLevel), _levelBreathing];

if !(isNil "ace_medical_vitals_fnc_addSpO2DutyFactor") then {
    private _breathingEffectiveness = linearConversion [0.2, 1, _levelBreathing, 1, 0.6, true];
    [QUOTE(ADDON), _breathingEffectiveness] call ace_medical_vitals_fnc_addSpO2DutyFactor;
};

// Event
private _smoked = _unit getVariable [QGVAR(smoked), false];
if (_isInSmoke != _smoked) then {
    _unit setVariable [QGVAR(smoked), _isInSmoke, true];
    [QGVAR(smoked), _isInSmoke] call CBA_fnc_localEvent;
};
