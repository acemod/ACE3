#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut, modified by GhostIsSpooky
 * Creates the speed indicator.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_ui_fnc_createSpeedIndicator
 *
 * Public: No
 */

QGVAR(speedIndicator) cutRsc [QGVAR(speedIndicatorDisplay), "PLAIN", 0.01, false];

private _speedIndicator = uiNamespace getVariable [QGVAR(speedIndicator), controlNull];
_speedIndicator ctrlShow GVAR(enableSpeedIndicator);
