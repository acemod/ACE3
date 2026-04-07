#include "..\script_component.hpp"
/*
 * Author: Zorn
 * Updates Detector Radius on CBA Setting Changed.
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Example:
 * [] call ace_minedetector_fnc_updateDetectorRadius;
 *
 * Public: No
 */

params ["_setting"];


if !( _setting in [QGVAR(radiusMode), QGVAR(radiusMode_customRadius)] ) exitWith {};

{
    _y set [
        1,
        _x call FUNC(getDetectorRadius)
    ];

} forEach GVAR(detectorConfigs);

nil
