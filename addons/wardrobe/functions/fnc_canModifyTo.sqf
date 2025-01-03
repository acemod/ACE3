#include "../script_component.hpp"

/*
* Author: Zorn
* Check if the unit can modify from current to target. Checks and compares components.
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

params ["_unit", "_cfg_origin", "_cfg_target", ["_cache", true, [true]]];

[_cfg_origin, _cfg_target] call FUNC(compare_components) params ["_missing", "_surplus"];

private _currentItems = [_unit, _cache] call FUNC(getItems_all);

count ( _missing select { ! (_x in _currentItems) } ) == 0
