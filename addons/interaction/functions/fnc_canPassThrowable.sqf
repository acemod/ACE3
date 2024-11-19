#include "..\script_component.hpp"
/*
 * Author: Timi007
 * Checks if target unit can accept given throwable.
 * Does not check if the throwable exists in the inventory of the player.
 *
 * Arguments:
 * 0: Unit that passes the throwable <OBJECT>
 * 1: Unit to pass the throwable to <OBJECT>
 * 2: Throwable classname <STRING>
 *
 * Return Value:
 * Unit can pass throwable <BOOL>
 *
 * Example:
 * [_player, _target, "HandGrenade"] call ace_interaction_fnc_canPassThrowable
 *
 * Public: No
 */

params ["_player", "_target", "_throwable"];

if (!GVAR(enableThrowablePassing)) exitWith {false};
if (_throwable isEqualTo "") exitWith {false};
if !(_target call EFUNC(common,isAwake)) exitWith {false};
if ((!isNull objectParent _target) && {(vehicle _target) isNotEqualTo (vehicle _player)}) exitWith {false};

[_target, _throwable] call CBA_fnc_canAddItem
