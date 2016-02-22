#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

// cache config
// items in the inventory display can only be distinguished by their lb names and pictures
// this can cause collisions (mainly weapons with attachments),
// but if the item has the same name and picture it at least shouldn't change the filter anyway
// luckily we don't need private items, so dummy and parent classes are out of the picture

if !(uiNamespace getVariable [QGVAR(configCached), false]) then {
    private _fnc_addToCache = {
        private _displayName = getText (_this >> "displayName");
        private _picture = getText (_this >> "picture");

        // list box seems to delete the leading backslash
        if (_picture select [0,1] == "\") then {
            _picture = _picture select [1];
        };

        uiNamespace setVariable [format [QGVAR(ItemKey:%1:%2), _displayName, _picture], _this];
    };

    // weapons and items
    {
        if (getNumber (_x >> "scope") > 0) then {_x call _fnc_addToCache};
        false
    } count (
        ("true" configClasses (configFile >> "CfgWeapons")) + 
        ("true" configClasses (configFile >> "CfgGlasses"))
    );

    // magazines
    {
        if (getNumber (_x >> "scope") == 2) then {_x call _fnc_addToCache};
        false
    } count ("true" configClasses (configFile >> "CfgMagazines"));

    // backpacks
    {
        if (getNumber (_x >> "scope") > 0 && {getNumber (_x >> "isBackpack") == 1}) then {_x call _fnc_addToCache};
        false
    } count ("true" configClasses (configFile >> "CfgVehicles"));

    uiNamespace setVariable [QGVAR(configCached), true];
};

ADDON = true;
