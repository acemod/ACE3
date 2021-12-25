#include "script_component.hpp"
/*
 * Author: GhostIsSpooky
 * Handles pause menu being opened or closed.
 *
 * Arguments:
 * 0: Hide? <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call ace_common_fnc_hideHUDHelper
 *
 * Public: Yes
 */
params ["_hide"];

private _uiHelper = uiNamespace getVariable ["ACE_RscHUDHelper", displayNull];
if (isNull _uiHelper) exitWith {};

{
    if !(isNull (ctrlParentControlsGroup _x)) then { continue }; // skip children of control groups

    private _id = ctrlClassName _x;
    private _condition = GVAR(hudHelperHash) get _id;

    _x ctrlShow (!_hide) && _condition;
} forEach (allControls _uiHelper);
