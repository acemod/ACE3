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
 * [_cfgOrigin, _cfgTarget] call ace_wardrobe_fnc_compareComponents
 *
 * Public: No
 */

params ["_cfgOrigin", "_cfgTarget"];

private _checkfallbackComponent = {
    // Check if item is present within current modpack.
    // If not, will look-up if item is defined within ace_Wardrobe and has an fallbackComponent defined.
    // If not, the component will be fully ignored.
    if (isNull (_x call CBA_fnc_getItemConfig)) then {
        getText (configFile >> QUOTE(ADDON) >> _x >> "fallbackComponent");
    } else {
        _x
    };
};


private _current = getArray (configFile >> QUOTE(ADDON) >> configName _cfgOrigin >> "components") apply _checkfallbackComponent select {_x isNotEqualTo ""};
private _needed  = getArray (configFile >> QUOTE(ADDON) >> configName _cfgTarget >> "components") apply _checkfallbackComponent select {_x isNotEqualTo ""};

private _missing = []; 

{
    if (_x in _current) then {
        _current = _current - [_x]
    } else {
        _missing pushBack _x
    };
} forEach _needed;

[_missing, _current]
