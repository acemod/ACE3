#include "script_component.hpp"
/*
 * Author: mharis001
 * Handles the mouse moving event for an intel control.
 *
 * Arguments:
 * 0: Header control <CONTROL>
 * 1: X position <NUMBER>
 * 2: Y position <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL, 0.1, 0.2] call ace_intelitems_fnc_onMouseMoving
 *
 * Public: No
 */

params ["_ctrlHeader", "_posX", "_posY"];

private _controlsGroup = ctrlParentControlsGroup _ctrlHeader;

private _clickPos = _controlsGroup getVariable QGVAR(clickPos);
if (isNil "_clickPos") exitWith {};

ctrlPosition _controlsGroup params ["_groupX", "_groupY"];
_clickPos params ["_clickX", "_clickY"];

_controlsGroup ctrlSetPosition [_groupX + _posX - _clickX, _groupY + _posY - _clickY];
_controlsGroup ctrlCommit 0;
