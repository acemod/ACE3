#include "..\script_component.hpp"
/*
 * Author: commy2
 * Adds a custom filter list to the inventory display.
 * Functions are here as strings, because list boxes can only store numbers and strings.
 *
 * Arguments:
 * 0: Localized filter display name <STRING>
 * 1: Filter function name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["displayname", "filter"] call ace_inventory_fnc_addCustomFilter
 *
 * Public: No
 */

params [["_filterName", "", [""]], ["_fncName", "", [""]]];

if (_filterName == "") exitWith {};

GVAR(customFilters) pushBack [_filterName, _fncName];
