#include "..\script_component.hpp"
/*
 * Author: Timi007
 * Checks if target unit can accept throwables.
 *
 * Arguments:
 * 0: Unit to pass the throwable to <OBJECT>
 * 1: Unit that passes the throwable <OBJECT>
 *
 * Return Value:
 * Unit can pass throwables <BOOL>
 *
 * Example:
 * [_target, _player] call ace_interaction_fnc_canPassThrowables
 *
 * Public: No
 */

params [["_target", objNull, [objNull]], ["_player", objNull, [objNull]]];

if (!GVAR(enableThrowablePassing)) exitWith {false};
if !(_target call EFUNC(common,isAwake)) exitWith {false};
if ((!isNull objectParent _target) && {(vehicle _target) isNotEqualTo (vehicle _player)}) exitWith {false};

true
