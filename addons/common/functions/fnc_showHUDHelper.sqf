#include "script_component.hpp"
/*
 * Author: GhostIsSpooky
 * Handles showing/hiding registered HUD elements.
 *
 * Arguments:
 * 0: Show? <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call ace_common_fnc_showHUDHelper
 *
 * Public: Yes
 */
params ["_show"];

private _uiHelper = uiNamespace getVariable ["ACE_RscHUDHelper", displayNull];
if (isNull _uiHelper) exitWith {};

{
    if !(isNull (ctrlParentControlsGroup _x)) then { continue }; // skip children of control groups

    private _id = ctrlClassName _x;
    private _condition = GVAR(hudHelperHash) get _id;
    private _hide = _show && _condition;
    _x ctrlShow _hide;
} forEach (allControls _uiHelper);
