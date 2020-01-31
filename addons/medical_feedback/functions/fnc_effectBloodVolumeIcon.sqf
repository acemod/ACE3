#include "script_component.hpp"
/*
 * Author: 10Dozen
 * Handles the blood volume icon
 *
 * Arguments:
 * 0: Enable <BOOL>
 * 1: Intensity 0...6 <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true, 4] call ace_medical_feedback_fnc_effectBloodVolumeIcon
 *
 * Public: No
 */

params ["_enable", "_intensity"];

if (!_enable || !GVAR(showBloodVolumeIcon)) exitWith {
    with uiNamespace do {
        if (ctrlText BloodVolumeInfoControlGroup == "") exitWith {};
        BloodVolumeInfoControlGroup ctrlSetText "";
        BloodVolumeInfoControlGroup ctrlSetTextColor ICON_BLOODVOLUME_COLOR_NONE;
        BloodVolumeInfoControlGroup ctrlCommit 0;
    };
};

private _text = "";
private _color = ICON_BLOODVOLUME_COLOR_NONE;

if (_intensity > 0) then {
    _text = format [ICON_BLOODVOLUME_PATH, _intensity];
    if (_intensity > 2) then {
        _color = if (_intensity > 4) then { ICON_BLOODVOLUME_COLOR_RED } else { ICON_BLOODVOLUME_COLOR_ORANGE };
    } else {
        _color = ICON_BLOODVOLUME_COLOR_WHITE;
    };
};

// --- Affecting UI icon with proper image and color
uiNamespace setVariable [QGVAR(bloodVolumeIconInfo), [_text, _color]];
with uiNamespace do {
    BloodVolumeInfoControlGroup ctrlSetText (GVAR(bloodVolumeIconInfo) select 0);
    BloodVolumeInfoControlGroup ctrlSetTextColor (GVAR(bloodVolumeIconInfo) select 1);
    BloodVolumeInfoControlGroup ctrlCommit 0;
};