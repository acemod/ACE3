#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Function to compare the components of the current and target wearables.
 *
 * Arguments:
 * 0: Current variant <STRING>
 * 1: Desired variant <STRING>
 *
 * Return Value:
 * Nested array <ARRAY>
 * - 0: Configs of missing components <ARRAY of CONFIGs>
 * - 1: Configs of surplus components <ARRAY of CONFIGs>
 *
 * Example:
 * [G_Balaclava_blk, G_Balaclava_combat] call ace_wardrobe_fnc_compareComponents
 *
 * Public: No
 */

params ["_classOrigin", "_classTarget"];

private _checkfallbackComponent = {
    // check if item is present within current modpack
    // if not, will look-up if item is defined within ace_Wardrobe and has an fallbackComponent defined
    // if not, the component will be fully ignored
    if (isNull (_x call CBA_fnc_getItemConfig)) then {
        getText (configFile >> QUOTE(ADDON) >> _x >> "fallbackComponent")
    } else {
        _x
    };
};

private _current = getArray (configFile >> QUOTE(ADDON) >> _classOrigin >> "components")
    apply _checkfallbackComponent
    select { _x isNotEqualTo "" };
private _needed  = getArray (configFile >> QUOTE(ADDON) >> _classTarget >> "components")
    apply _checkfallbackComponent
    select { _x isNotEqualTo "" };

private _missing = [];

{
    if (_x in _current) then {
        _current = _current - [_x]
    } else {
        _missing pushBack _x
    };
} forEach _needed;

[_missing, _current]
