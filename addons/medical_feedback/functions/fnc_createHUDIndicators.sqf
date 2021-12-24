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

private _hudContainer = _display ctrlCreate [QGVAR(HUDIndicatorsContainer), -1];
uiNamespace setVariable [QGVAR(HUDIndicatorsContainer), _hudContainer];

_hudContainer ctrlCommit 0;
