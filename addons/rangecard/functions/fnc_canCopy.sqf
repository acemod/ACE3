#include "..\script_component.hpp"
/*
 * Authors: Ruthberg
 * Checks if the target has a copyable range card.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Range card is copyable <BOOL>
 *
 * Example:
 * [cursorObject, player] call ace_rangecard_fnc_canCopy
 *
 * Public: No
 */

params ["_target", "_unit"];

(primaryWeapon _target) != "" && {_target call EFUNC(common,isPlayer)} && {[_target, "ACE_RangeCard"] call EFUNC(common,hasItem)} && {[_unit, "ACE_RangeCard"] call EFUNC(common,hasItem)} // return
