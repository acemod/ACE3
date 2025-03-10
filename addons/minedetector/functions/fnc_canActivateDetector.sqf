#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Checks if the mine detector can be activated.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Detector type <STRING> (default: currentWeapon Unit)
 *
 * Return Value:
 * Can be activated <BOOL>
 *
 * Example:
 * [player, currentWeapon player] call ace_minedetector_fnc_canActivateDetector
 *
 * Public: No
 */

params ["_unit"];

if (!local _unit || {!alive _unit}) exitWith {
    false // return
};

private _detectorType = param [1, currentWeapon _unit, [""]];

[_unit, _detectorType] call FUNC(hasDetector) && {!([_unit, _detectorType] call FUNC(isDetectorEnabled))} // return
