#include "..\script_component.hpp"
/*
 * Author: ACE-Team
 * Forces an FCS update (range measurement and solution) for the unit's current turret.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_fcs_fnc_onForceUpdate
 *
 * Public: No
 */

params ["_unit"];

private _vehicle = vehicle _unit;

if !([_unit, _vehicle, []] call EFUNC(common,canInteractWith)) exitWith {false};
if !((!GVAR(enabled) && FUNC(canUseFCS)) || FUNC(canUseRangefinder)) exitWith {false};

private _turret = [_unit] call EFUNC(common,getTurretIndex);

[_vehicle, _turret] call FUNC(keyDown);
[_vehicle, _turret] call FUNC(keyUp);
