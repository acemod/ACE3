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

GVAR(enableThrowablePassing) &&
{_throwable != ""} &&
{(objectParent _target) isEqualTo (objectParent _player)} &&
{_target call EFUNC(common,isAwake)} &&
{_target canAdd [_throwable, 1, true]}
