#include "..\script_component.hpp"
/*
 * Author: Zorn
 * Returns Detector Radius based on Settings.
 *
 * Arguments:
 * 0: Detector type <STRING>
 *
 * Return Value:
 * Radius <NUMBER>
 *
 * Example:
 * (currentWeapon player) call ace_minedetector_fnc_getDetectorRadius;
 *
 * Public: No
 */

params ["_detectorType"];

switch ( GVAR(radiusMode) ) do {
    case "CUSTOM_RADIUS": { round (GVAR(radiusMode_customRadius) * 10 ) / 10 };
    default { getNumber (configFile >> "ACE_detector" >> "detectors" >> _detectorType >> "radius") };
}
