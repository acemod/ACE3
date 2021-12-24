#include "script_component.hpp"
/*
 * Author: veteran29, modified by GhostIsSpooky
 * Handles visual changes of the speed indicator.
 *
 * Arguments:
 * Current animation state <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["amovpercmtacslowwrfldf_ver2"] call ace_ui_fnc_handleSpeedIndicator
 *
 * Public: No
 */

params ["_animState"];

if (!GVAR(enableSpeedIndicator)) exitWith {};

private _animSpeed = _animState select [9, 3];
private _isProne = _animState select [5, 3] isEqualTo "pne";

private _icon = GVAR(speedIndicatorIconHash) getOrDefault [[_animSpeed, _isProne], ""];

private _speedIndicatorContainer = uiNamespace getVariable [QGVAR(speedIndicatorContainer), controlNull];
(_speedIndicatorContainer controlsGroupCtrl 10) ctrlSetText _icon;

_speedIndicatorContainer ctrlSetFade 0;
_speedIndicatorContainer ctrlCommit 0
