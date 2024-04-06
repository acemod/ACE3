#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Get the mine detector configuration from the cache or config file
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

params ["_detectorType"];

if (_detectorType isEqualTo "") exitWith {[]};

GVAR(detectorConfigs) getOrDefaultCall [_detectorType, {
    private _cfgEntry = (configFile >> "ACE_detector" >> "detectors" >> _detectorType);
    if (isClass _cfgEntry) then {
        [
            _detectorType,
            getNumber (_cfgEntry >> "radius"),
            getArray (_cfgEntry >> "sounds")
        ];
    } else {
        []
    };
}, true]
