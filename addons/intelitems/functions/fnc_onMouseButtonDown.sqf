#include "script_component.hpp"
/*
 * Author: mharis001
 * Handles the mouse button down event for an intel control.
 *
 * Arguments:
 * 0: Header control <CONTROL>
 * 1: Button <NUMBER>
 * 2: X position <NUMBER>
 * 3: Y position <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL, 0, 0.5, 0.5] call ace_intelitems_fnc_onMouseButtonDown
 *
 * Public: No
 */

params ["_ctrlHeader", "_button", "_posX", "_posY"];

if (_button != 0) exitWith {};

private _controlsGroup = ctrlParentControlsGroup _ctrlHeader;
_controlsGroup setVariable [QGVAR(clickPos), [_posX, _posY]];
