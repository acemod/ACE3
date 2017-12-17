/*
 * Author: 654wak654
 * Checks if given unit can access the pylon configuration dialog for the given aircraft.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Aircraft <OBJECT>
 *
 * Return Value:
 * Unit can configure the aircraft's pylons <BOOL>
 *
 * Example:
 * [ace_player, cursorObject] call ace_pylons_fnc_canConfigurePylons
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_aircraft"];

if (GVAR(requireEngineer) && {!([_unit] call EFUNC(common,isEngineer))}) exitWith {false};

if (GVAR(requireToolkit) && {!([_unit, "ToolKit"] call EFUNC(common,hasItem))}) exitWith {false};

if ((_unit distanceSqr _aircraft) > GVAR(searchDistanceSqr)) exitWith {false};

[_unit, _aircraft] call EFUNC(common,canInteractWith)
