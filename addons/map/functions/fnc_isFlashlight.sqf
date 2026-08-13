#include "..\script_component.hpp"
/*
 * Author: veteran29
 * Checks if the given item is a flashlight.
 *
 * Arguments:
 * 0: Item Classname <STRING>
 *
 * Return Value:
 * Is flashlight <BOOL>
 *
 * Example:
 * ["acc_flashlight"] call ace_map_fnc_isFlashlight
 *
 * Public: No
 */

params [["_class", "", [""]]];

GVAR(flashlights) getOrDefaultCall [_class, {
    private _items = [_class];
    if (isClass (configFile >> "CfgWeapons" >> _class)) then {
        _items append (_class call CBA_fnc_switchableAttachments); // Contains _class in the return
    };
    _items = _items arrayIntersect _items; // Prevent duplicate config lookups

    // if this item or any of the switchable items is a flashlight
    _items findIf {
        private _itemConfig = _x call CBA_fnc_getItemConfig;

        [
            _itemConfig >> "ItemInfo" >> "FlashLight",
            _itemConfig >> "FlashLight"
        ] findIf {
            isText (_x >> "ACE_Flashlight_Colour")
            || {!(getArray (_x >> "ambient") in [[], [0,0,0]]) && {getNumber (_x >> "irLight") == 0}}
        } != -1 // return
    } != -1 // return
}, true] // return
