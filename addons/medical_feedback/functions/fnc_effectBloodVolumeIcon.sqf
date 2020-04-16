#include "script_component.hpp"
/*
 * Author: 10Dozen
 * Handles the blood volume icon.
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

private _indicatorCtrl = uiNamespace getVariable [QGVAR(bloodVolumeIndicator), controlNull];

if (!_enable || !GVAR(showBloodVolumeIcon)) exitWith {
    _indicatorCtrl ctrlSetText "";
};

private _text = "";
private _color = ICON_BLOODVOLUME_COLOR_NONE;

if (_intensity > 0) then {
    _text = ICON_BLOODVOLUME_PATH(_intensity);
    if (_intensity > 2) then {
        _color = [ICON_BLOODVOLUME_COLOR_ORANGE, ICON_BLOODVOLUME_COLOR_RED] select (_intensity > 4);
    } else {
        _color = ICON_BLOODVOLUME_COLOR_WHITE;
    };
};

// --- Affecting UI icon with proper image and color
_indicatorCtrl ctrlSetText _text;
_indicatorCtrl ctrlSetTextColor _color;
