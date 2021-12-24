#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut, modified by GhostIsSpooky
 * Creates the speed indicator.
 *
 * Arguments:
 * 0: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [DISPLAY] call ace_ui_fnc_createSpeedIndicator
 *
 * Public: No
 */
params ["_display"];

private _speedIndicator = _display ctrlCreate [QGVAR(SpeedIndicatorContainer), -1];
uiNamespace setVariable [QGVAR(speedIndicatorContainer), _speedIndicator];

_speedIndicator ctrlSetFade 1;
_speedIndicator ctrlCommit 0;
