/*
 * Author: BaerMitUmlaut
 * Disables NVGs when the player aims down his sight.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_nightvision_fnc_disableNVGs
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit"];

if (GVAR(disableNVGsWithSights) && {(hmd _unit) != ""}) then {
    (assignedVehicleRole _unit) params ["_role", "_turretPath"];
    if ((vehicle _unit == _unit) || {isTurnedOut _unit} || {_role == "cargo" && {!(isNil "_turretPath")}}) then {
        if ((cameraView == "GUNNER") && {currentVisionMode _unit > 0}) then {
            _unit action ["NVGogglesOff", _unit];
            GVAR(reenableNVGs) = true;
        } else {
            if (GVAR(reenableNVGs) && {cameraView != "GUNNER"}) then {
                _unit action ["NVGoggles", _unit];
                GVAR(reenableNVGs) = false;
            };
        };
    };
};
