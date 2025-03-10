#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Checks if the mine detector can be deactivated.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Detector type <STRING> (default: currentWeapon Unit)
 *
 * Return Value:
 * Can be deactivated <BOOL>
 *
 * Example:
 * call ace_minedetector_fnc_canDeactivateDetector
 *
 * Public: No
 */

params ["_unit"];

private _detectorType = param [1, currentWeapon _unit, [""]];

[_unit, _detectorType] call FUNC(hasDetector) && {[_unit, _detectorType] call FUNC(isDetectorEnabled)} // return
