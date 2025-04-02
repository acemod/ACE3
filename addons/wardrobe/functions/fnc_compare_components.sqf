#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * Function to compare the components of the current and target wearables.
 *
 * Arguments:
 * 0: current variant <CONFIG>
 * 1: desired variant <CONFIG>
 *
 * Return Value:
 * Nested array <ARRAY>
 * - configs of missing components <ARRAY>
 * - configs of surplus components <ARRAY>
 *
 * Example:
 * [_cfg_origin, _cfg_tgt] call ace_wardrobe_fnc_compare_components
 *
 * Public: No
 */

params ["_cfg_origin", "_cfg_tgt"];

private _current = getArray (_cfg_origin >> "ace_wardrobe" >> "components");
private _needed  = getArray (_cfg_tgt    >> "ace_wardrobe" >> "components");

private _missing = []; 

{
    if (_x in _current) then {
        _current = _current - [_x]
    } else {
        _missing pushBack _x
    };
} forEach _needed;

[_missing, _current]
