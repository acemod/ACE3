/*
 * Author: BaerMitUmlaut
 * Creates the stamina bar.
 *
 * Arguments:
 * 0: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [DISPLAY] call ace_advanced_fatigue_fnc_createStaminaBar
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_display"];

private _staminaBar = _display ctrlCreate [QGVAR(StaminaBarContainer), -1];
uiNamespace setVariable [QGVAR(staminaBarContainer), _staminaBar];

_staminaBar ctrlSetFade 1;
_staminaBar ctrlCommit 0;
