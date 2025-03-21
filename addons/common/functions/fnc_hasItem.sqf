#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Check if given unit has an item of given classname. Note: Case sensitive.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Item classname <STRING>
 *
 * Return Value:
 * Unit has item <BOOL>
 *
 * Example:
 * [player, "ACE_Banana"] call ace_common_fnc_hasItem
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]], ["_item", "", [""]]];

_item in (_unit call FUNC(uniqueItems)) // return
