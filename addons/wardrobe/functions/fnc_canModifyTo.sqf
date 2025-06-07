#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Condition check if the unit can modify from current variant to target variant. Checks and compares components.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Current variant <CONFIG>
 * 2: Desired variant <CONFIG>
 * 3: Cache the result of fnc_getitemsAll <BOOL> (default: true)
 *
 * Return Value:
 * Result <BOOL>
 *
 * Example:
 * [player, configFile >> "CfgWeapons" >> "U_B_CTRG_1", configFile >> "CfgWeapons" >> "U_B_CTRG_3"] call ace_wardrobe_fnc_canModifyTo
 *
 * Public: No
 */

params ["_player", "_cfgOrigin", "_cfgTarget", ["_cache", true, [true]]];

private _missing = ([configName _cfgOrigin, configName _cfgTarget] call FUNC(compareComponents)) select 0;

private _currentItems = [_player, _cache] call FUNC(getItemsAll);

_missing findIf { ! (_x in _currentItems) } != -1 // return
