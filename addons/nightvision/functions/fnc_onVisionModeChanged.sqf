/*
 * Author: BaerMitUmlaut
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
