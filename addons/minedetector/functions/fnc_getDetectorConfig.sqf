#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Gets the mine detector configuration from the cache or config file.
 *
 * Arguments:
 * 0: Detector type <STRING>
 *
 * Return Value:
 * Detector configuration or empty array if invalid <ARRAY>
 *
 * Example:
 * (currentWeapon player) call ace_minedetector_fnc_getDetectorConfig
 *
 * Public: No
 */

params ["_detectorType"];

if (_detectorType == "") exitWith {
    [] // return
};

GVAR(detectorConfigs) getOrDefaultCall [toLowerANSI _detectorType, {
    private _cfgEntry = configFile >> "ACE_detector" >> "detectors" >> _detectorType;

    if (isClass _cfgEntry) then {
        private _detectorPosition = getArray (_cfgEntry >> "detectorPosition");
        private _sounds = getArray (_cfgEntry >> "sounds");
        private _soundDistances = getArray (_cfgEntry >> "soundDistances");
        private _soundIntervals = getArray (_cfgEntry >> "soundIntervals");
        private _soundIntervalDistances = getArray (_cfgEntry >> "soundIntervalDistances");

        reverse _sounds;
        reverse _soundDistances;
        reverse _soundIntervals;
        reverse _soundIntervalDistances;

        if (_detectorPosition isEqualTo [] || {_sounds isEqualTo []} || {_soundIntervals isEqualTo []} || {count _sounds != count _soundDistances} || {count _soundIntervals != count _soundIntervalDistances}) then {
            ERROR_1("Mine detector %1 is configured badly",_detectorType);
        };

        [
            _detectorPosition,
            getNumber (_cfgEntry >> "radius"),
            _sounds,
            _soundDistances,
            _soundIntervals,
            _soundIntervalDistances
        ]
    } else {
        []
    };
}, true] // return
