#include "script_component.hpp"

ADDON = false;

PREP(addCustomFilter);
PREP(currentItemListBox);
PREP(forceItemListUpdate);
PREP(inventoryDisplayLoaded);
PREP(onLBSelChanged);

// cache config
if !(uiNamespace getVariable [QGVAR(configCached), false]) then {
    // weapons, magazines, items
    {
        if (getNumber (_x >> "scope") > 0) then {
            private _displayName = getText (_x >> "displayName");
            private _picture = getText (_x >> "picture");

            if (_picture select [0,1] == "\") then {
                _picture = _picture select [1];
            };

            uiNamespace setVariable [format [QGVAR(ItemKey:%1), _displayName, _picture], _x];
        };
        false
    } count (
        ("true" configClasses (configFile >> "CfgWeapons")) + 
        ("true" configClasses (configFile >> "CfgMagazines")) + 
        ("true" configClasses (configFile >> "CfgGlasses"))
    );

    // backpacks
    {
        if (getNumber (_x >> "scope") > 0 && {getNumber (_x >> "isBackpack") == 1}) then {
            private _displayName = getText (_x >> "displayName");
            private _picture = getText (_x >> "picture");

            if (_picture select [0,1] == "\") then {
                _picture = _picture select [1];
            };

            uiNamespace setVariable [format [QGVAR(ItemKey:%1), _displayName, _picture], _x];
        };
        false
    } count ("true" configClasses (configFile >> "CfgVehicles"));

    uiNamespace setVariable [QGVAR(configCached), true];
};

ADDON = true;
