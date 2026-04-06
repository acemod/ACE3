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

{
    _y set [
        2,
        switch (QGVAR(radiusMode)) do {
            case "CUSTOM_RADIUS": { GVAR(radiusMode_customRadius) };
            default { getNumber (configFile >> "ACE_detector" >> "detectors" >> _x >> "radius") };
        }
    ];

} forEach GVAR(detectorConfigs);

nil
