/*
 * Author: Glowbal
 * Check if unit has item
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Item Classname <STRING>
 *
 * Return Value:
 * has Item <BOOL>
 *
 * Example:
 * [[bob, "item"] call ace_common_fnc_hasItem
 *
 * Public: yes
 *
 * Note: Case sensitive
 */
#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_item", "", [""]]];

_item in items _unit // return
