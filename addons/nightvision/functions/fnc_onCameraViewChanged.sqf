/*
 * Author: BaerMitUmlaut
 * Disables/re-enables NVGs when the player starts/stops aiming down his sight.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: New camera view <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "GUNNER"] call ace_nightvision_fnc_onCameraViewChanged
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_cameraView"];
TRACE_2("onCameraViewChanged",_unit,_cameraView);

// Refresh goggle effect (e.g. switching to vehicle's NVG)
[] call FUNC(refreshGoggleType);

if (GVAR(disableNVGsWithSights) && {(hmd _unit) != ""}) then {
    if ((vehicle _unit == _unit)
        || {isTurnedOut _unit}
        || {!([_unit] call EFUNC(common,hasHatch))
            && {[_unit] call EFUNC(common,getTurretIndex) in ([vehicle _unit] call EFUNC(common,getTurretsFFV))}
           }) then {
        if ((_cameraView == "GUNNER") && {currentVisionMode _unit == 1}) then {
            _unit action ["NVGogglesOff", _unit];
            _unit setVariable [QGVAR(reenableNVGs), true];
        } else {
            if (_unit getVariable [QGVAR(reenableNVGs), false] && {_cameraView != "GUNNER"}) then {
                _unit action ["NVGoggles", _unit];
                _unit setVariable [QGVAR(reenableNVGs), false];
            };
        };
    };
};
