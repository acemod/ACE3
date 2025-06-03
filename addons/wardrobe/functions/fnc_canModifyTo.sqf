#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Condition check if the unit can modify from current variant to target variant. Checks and compares components.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Current variant <Config>
 * 2: Desired variant <Config>
 * 3: Cache the result of fnc_getitemsAll <BOOL> (default: true)
 *
 * Return Value:
 * Result <BOOL>
 *
 * Example:
 * [_unit, _cfgOrigin, _cfgTarget] call ace_wardrobe_fnc_canModifyTo
 *
 * Public: No
 */

params ["_unit", "_cfgOrigin", "_cfgTarget", ["_cache", true, [true]]];

[_cfgOrigin, _cfgTarget] call FUNC(compareComponents) params ["_missing", "_surplus"];

private _currentItems = [_unit, _cache] call FUNC(getItemsAll);

_missing select { ! (_x in _currentItems) } isEqualTo [] // return
