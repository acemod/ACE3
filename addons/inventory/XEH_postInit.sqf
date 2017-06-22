#include "script_component.hpp"

if (!hasInterface) exitWith {};

// cache config
// items in the inventory display can only be distinguished by their lb names and pictures
// this can cause collisions (mainly weapons with attachments),
// but if the item has the same name and picture it at least shouldn't change the filter anyway
// luckily we don't need private items, so dummy and parent classes are out of the picture

GVAR(ItemKeyNamespace) = [] call CBA_fnc_createNamespace;

private _fnc_addToCache = {
    private _displayName = getText (_this >> "displayName");
    private _picture = getText (_this >> "picture");

    // list box seems to delete the leading backslash
    if (_picture select [0,1] == "\") then {
        _picture = _picture select [1];
    };

    GVAR(ItemKeyNamespace) setVariable [format ["%1:%2", _displayName, _picture], _this];
};

private _allItems = [];

_allItems append ("getNumber (_x >> 'scope') > 0" configClasses (configFile >> "CfgWeapons"));
_allItems append ("getNumber (_x >> 'scope') > 0" configClasses (configFile >> "CfgGlasses"));
_allItems append ("getNumber (_x >> 'scope') == 2" configClasses (configFile >> "CfgMagazines"));
_allItems append ("getNumber (_x >> 'scope') > 0 && {getNumber (_x >> 'isBackpack') == 1}" configClasses (configFile >> "CfgVehicles"));

{_x call _fnc_addToCache; false} count _allItems;

GVAR(customFilters) = [];
GVAR(selectedFilterIndex) = -1;

// add custom filters

// generate list of grenades
GVAR(Grenades_ItemList) = [];

{
    GVAR(Grenades_ItemList) append getArray (configFile >> "CfgWeapons" >> "Throw" >> _x >> "magazines");
    false
} count getArray (configFile >> "CfgWeapons" >> "Throw" >> "muzzles");

// make list case insensitive
GVAR(Grenades_ItemList) = GVAR(Grenades_ItemList) apply {toLower _x};

// filter duplicates
GVAR(Grenades_ItemList) = GVAR(Grenades_ItemList) arrayIntersect GVAR(Grenades_ItemList);

[localize LSTRING(Grenades), QFUNC(filterGrenades)] call FUNC(addCustomFilter);

[localize LSTRING(Backpacks), QFUNC(filterBackpacks)] call FUNC(addCustomFilter);
[localize LSTRING(Uniforms), QFUNC(filterUniforms)] call FUNC(addCustomFilter);
[localize LSTRING(Vests), QFUNC(filterVests)] call FUNC(addCustomFilter);
[localize LSTRING(Headgear), QFUNC(filterHeadgear)] call FUNC(addCustomFilter);

// generate list of medical items
GVAR(Medical_ItemList) = [];

{
    GVAR(Medical_ItemList) append getArray (_x >> "items");
    false
} count (
    ("true" configClasses (configFile >> QEGVAR(Medical,Actions) >> "Basic")) +
    ("true" configClasses (configFile >> QEGVAR(Medical,Actions) >> "Advanced"))
);

// remove all numbers from list
GVAR(Medical_ItemList) = GVAR(Medical_ItemList) select {_x isEqualType ""};

// make list case insensitive
GVAR(Medical_ItemList) = GVAR(Medical_ItemList) apply {toLower _x};

// filter duplicates
GVAR(Medical_ItemList) = GVAR(Medical_ItemList) arrayIntersect GVAR(Medical_ItemList);

[localize LSTRING(Medical), QFUNC(filterMedical)] call FUNC(addCustomFilter);
