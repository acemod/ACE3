/*
 * Author: BaerMitUmlaut, Dslyecxi, PabstMirror
 * Disables turning on NVGs while the player aims down his sight.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: New vision mode <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 1] call ace_nightvision_fnc_onVisionModeChanged
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_visionMode"];
TRACE_2("onVisionModeChanged",_unit,_visionMode);

// handle only brightness if effects are disabled
if (GVAR(effectScaling) == 0) exitWith {
    GVAR(ppEffectNVGBrightness) ppEffectEnable (_visionMode == 1);
};

// Start PFEH when entering night vision mode:
if (_visionMode == 1) then {
    if (GVAR(PFID) == -1) then {
        GVAR(running) = true;
        [true] call FUNC(setupDisplayEffects);
        [] call FUNC(refreshGoggleType);
        GVAR(PFID) = [LINKFUNC(pfeh), 0, []] call CBA_fnc_addPerFrameHandler;

        // Fade in from black when turning nvg on
        QGVAR(turnOnEffect) cutText ["", "BLACK IN", 2.5];
    };
};

// Handle disableNVGsWithSights setting:
if (GVAR(disableNVGsWithSights) && {(hmd _unit) != ""}) then {
    if ((vehicle _unit == _unit)
            || {isTurnedOut _unit}
            || {!([_unit] call EFUNC(common,hasHatch))
                && {[_unit] call EFUNC(common,getTurretIndex) in ([vehicle _unit] call EFUNC(common,getTurretsFFV))}
            }) then {
        if ((cameraView == "GUNNER") && {_visionMode > 0}) then {
            _unit action ["NVGogglesOff", _unit];
        };
    };
};
