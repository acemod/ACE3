#include "script_component.hpp"
/*
 * Author: veteran29
 * Check if given class is a flashlight
 *
 * Arguments:
 * 0: Class to check <STRING>
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

private _isFlashlight = GVAR(flashlights) getVariable _class;

if (isNil "_isFlashlight") then {

    private _items = _class call CBA_fnc_switchableAttachments;
    private _cfgWeapons = configFile >> "CfgWeapons";

    _isFlashlight = {
        private _weaponConfig = _cfgWeapons >> _x;

        if (-1 != [
            _weaponConfig >> "ItemInfo" >> "FlashLight",
            _weaponConfig >> "FlashLight"
        ] findIf {
            isText (_x >> "ACE_Flashlight_Colour")
            || {!(getArray (_x >> "ambient") in [[], [0,0,0]])}
        }) exitWith {
            true
        };
        false
    } forEach ([_class] + (_class call CBA_fnc_switchableAttachments));

    // cache value
    GVAR(flashlights) setVariable [_class, _isFlashlight];
};

_isFlashlight // return
