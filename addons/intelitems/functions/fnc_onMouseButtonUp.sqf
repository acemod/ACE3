#include "script_component.hpp"
/*
 * Author: mharis001
 * Handles the mouse button up event for an intel control.
 *
 * Arguments:
 * 0: Header control <CONTROL>
 * 1: Button <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL, 0] call ace_intelitems_fnc_onMouseButtonUp
 *
 * Public: No
 */

params ["_ctrlHeader", "_button"];

if (_button != 0) exitWith {};

private _controlsGroup = ctrlParentControlsGroup _ctrlHeader;
_controlsGroup setVariable [QGVAR(clickPos), nil];
