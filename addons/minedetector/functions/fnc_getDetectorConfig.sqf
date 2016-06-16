/*
 * Author: Glowbal
 * Get the mine detector configuration from the config file
 *
 * Arguments:
 * 0: Detector class name <STRING>
 *
 * Return Value:
 * Detector configuration or empty array if invalid <ARRAY>
 *
 * Example:
 * ["my_detector"] call ace_minedetector_fnc_getDetectorConfig
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_detectorType"];

private _config = (configFile >> "ACE_detector" >> "detectors" >> _detectorType);
if (isClass _config) then {
    [
        _detectorType,
        getNumber (_config >> "radius"),
        GVAR(ALL_DETECTABLE_TYPES), // TODO read from config and use this as a back up value instead
        getArray (_config >> "sounds")
    ];
} else {
    [];
};
