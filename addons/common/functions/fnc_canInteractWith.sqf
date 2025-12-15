#include "..\script_component.hpp"
/*
 * Author: commy2
 * Check if the unit can interact.
 *
 * Arguments:
 * 0: The player. <OBJECT>
 * 1: The interaction target. objNull to ignore. <OBJECT>
 * 2: Exceptions. What general conditions are to skip? (works like a permission system, if there is an exception, it will return true; e.g. "isNotSwimming" in the exceptions, the progress bar will work while swimming) <ARRAY> (default: [])
 *
 * Return Value:
 * Unit can interact? <BOOL>
 *
 * Example:
 * [bob, target, []] call ace_common_fnc_canInteractWith
 *
 * Public: Yes
 */

params ["_unit", "_target", ["_exceptions", []]];

_exceptions = _exceptions apply {toLowerANSI _x};

private _owner = _target getVariable [QGVAR(owner), objNull];

// exit if the target is not free to interact
if (!isNull _owner && {_unit != _owner}) exitWith {false};

// check general conditions
private _canInteract = true;
{
    if (!(_x in _exceptions) && {!([_unit, _target] call _y)}) exitWith {
        _canInteract = false;
    };
} forEach GVAR(InteractionConditions);

_canInteract
