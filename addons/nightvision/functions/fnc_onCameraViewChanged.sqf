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

if (GVAR(disableNVGsWithSights) && {(hmd _unit) != ""}) then {
    (assignedVehicleRole _unit) params ["_role", "_turretPath"];
    if ((vehicle _unit == _unit) || {isTurnedOut _unit} || {_role == "cargo" && {!(isNil "_turretPath")}}) then {
        if ((_cameraView == "GUNNER") && {currentVisionMode _unit > 0}) then {
            _unit action ["NVGogglesOff", _unit];
            GVAR(reenableNVGs) = true;
        } else {
            if (GVAR(reenableNVGs) && {_cameraView != "GUNNER"}) then {
                _unit action ["NVGoggles", _unit];
                GVAR(reenableNVGs) = false;
            };
        };
    };
};
