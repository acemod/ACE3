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

private _checkfallbackComponent = {
    // Check if item is present within current modpack.
    // If not, will look-up if item is defined within ace_Wardrobe and has an fallbackComponent defined.
    // If not, the component will be fully ignored.
    if ([_x] call CBA_fnc_getItemConfig isEqualTo configNull) then {
        getText (configFile >> QUOTE(ADDON) >> _return >> "fallbackComponent");
    } else {
        _x
    };
};


private _current = getArray (configFile >> QUOTE(ADDON) >> configName _cfg_origin >> "components") apply _checkfallbackComponent select {_x isNotEqualTo ""};
private _needed  = getArray (configFile >> QUOTE(ADDON) >> configName _cfg_tgt    >> "components") apply _checkfallbackComponent select {_x isNotEqualTo ""};

private _missing = []; 

{
    if (_x in _current) then {
        _current = _current - [_x]
    } else {
        _missing pushBack _x
    };
} forEach _needed;

[_missing, _current]
