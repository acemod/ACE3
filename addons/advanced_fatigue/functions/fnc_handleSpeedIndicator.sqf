#include "script_component.hpp"
/*
 * Author: veteran29
 * Handles visual changes of the speed indicator.
 *
 * Arguments:
 * Current animation state <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["amovpercmtacslowwrfldf_ver2"] call ace_advanced_fatigue_fnc_handleSpeedIndicator
 *
 * Public: No
 */

params ["_animState"];

if (!GVAR(enableSpeedIndicator)) exitWith {};

private _animSpeed = _animState select [9, 3];
private _icon = GVAR(speedIndicatorIconHash) getOrDefault [[_animSpeed, GVAR(isProne)], ""];

private _speedIndicator = uiNamespace getVariable [QGVAR(speedIndicator), controlNull];
_speedIndicator ctrlSetText _icon;
