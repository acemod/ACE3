/*
 * Author: SzwedzikPL
 * Checks if item is a unique map
 *
 * Arguments:
 * 0: Item class <STRING>
 *
 * Return Value:
 * is a unique map <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_item"];

((toLower _item) find "ace_map_") == 0
