#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * Condition Check if the unit can modify from current variant to target variant. Checks and compares components.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Current Variant <Config>
 * 2: Desired Variant <Config>
 * 3: Cache Result of fnc_getitems_all <BOOL> (default: true)
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [_unit, _cfg_origin, _cfg_target] call ace_wardrobe_fnc_canModifyTo
 *
 * Public: No
 */

params ["_unit", "_cfg_origin", "_cfg_target", ["_cache", true, [true]]];

[_cfg_origin, _cfg_target] call FUNC(compare_components) params ["_missing", "_surplus"];

private _currentItems = [_unit, _cache] call FUNC(getItems_all);

count ( _missing select { ! (_x in _currentItems) } ) == 0
