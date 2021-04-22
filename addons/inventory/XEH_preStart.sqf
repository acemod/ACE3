#include "script_component.hpp"

#include "XEH_PREP.hpp"

//item cache, see XEH_postInit.sqf
private _allItems = ("getNumber (_x >> 'scope') > 0" configClasses (configFile >> "CfgWeapons"));
_allItems append ("getNumber (_x >> 'scope') > 0" configClasses (configFile >> "CfgGlasses"));
_allItems append ("getNumber (_x >> 'scope') == 2" configClasses (configFile >> "CfgMagazines"));
_allItems append ("getNumber (_x >> 'scope') > 0 && {getNumber (_x >> 'isBackpack') == 1}" configClasses (configFile >> "CfgVehicles"));

uiNamespace setVariable [QGVAR(ItemKeyCache), _allItems apply {
    private _displayName = getText (_x >> "displayName");
    private _picture = getText (_x >> "picture");

    // list box seems to delete the leading backslash
    if (_picture select [0,1] == "\") then {
        _picture = _picture select [1];
    };

    [format ["%1:%2", _displayName, _picture], _x];
}];

// generate list of grenades
private _grenades_ItemList = [];

{
    _grenades_ItemList append getArray (configFile >> "CfgWeapons" >> "Throw" >> _x >> "magazines");
} forEach getArray (configFile >> "CfgWeapons" >> "Throw" >> "muzzles");

// make list case insensitive
_grenades_ItemList = _grenades_ItemList apply {toLower _x};

// filter duplicates
_grenades_ItemList = _grenades_ItemList arrayIntersect _grenades_ItemList;

uiNamespace setVariable [QGVAR(Grenades_ItemList), _grenades_ItemList];

// generate list of medical items
private _medical_ItemList = ["FirstAidKit", "Medikit"];
{
    _medical_ItemList append getArray (_x >> "items");
} forEach ("true" configClasses (configFile >> QEGVAR(medical_treatment,Actions)));

// remove all numbers from list
_medical_ItemList = _medical_ItemList select {_x isEqualType ""};

// make list case insensitive
_medical_ItemList = _medical_ItemList apply {toLower _x};

// filter duplicates
_medical_ItemList = _medical_ItemList arrayIntersect _medical_ItemList;

uiNamespace setVariable [QGVAR(Medical_ItemList), _medical_ItemList];
