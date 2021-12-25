#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut, modified by GhostIsSpooky
 * Creates the HUD indicators.
 *
 * Arguments:
 * 0: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [DISPLAY] call ace_medical_feedback_fnc_createHUDIndicators
 *
 * Public: No
 */
params ["_display"];

QGVAR(HUDIndicators) cutRsc [QGVAR(HUDIndicatorsDisplay), "PLAIN", 0.01, false];
