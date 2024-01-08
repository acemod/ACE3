#include "script_component.hpp"

#include "XEH_PREP.hpp"

// Cache config
// Items in the inventory display can all use lb data to get their classname (exception: backpacks, handled separately)
private _allItems = ("getNumber (_x >> 'scope') > 0" configClasses (configFile >> "CfgWeapons"));
_allItems append ("getNumber (_x >> 'scope') > 0" configClasses (configFile >> "CfgGlasses"));
_allItems append ("getNumber (_x >> 'scope') > 0" configClasses (configFile >> "CfgMagazines"));

uiNamespace setVariable [QGVAR(itemKeyCache), compileFinal ((_allItems apply {configName _x}) createHashMapFromArray _allItems)];

// Backpacks in the inventory display can only be distinguished by their lb names and pictures, lb data returns ""
_allItems = "getNumber (_x >> 'scope') > 0 && {getNumber (_x >> 'isBackpack') == 1}" configClasses (configFile >> "CfgVehicles");

uiNamespace setVariable [QGVAR(backpackKeyCache), compileFinal createHashMapFromArray (_allItems apply {
    private _displayName = getText (_x >> "displayName");
    private _picture = getText (_x >> "picture");

    // List box seems to delete the leading backslash
    if (_picture select [0, 1] == "\") then {
        _picture = _picture select [1];
    };
    if (count _picture > 0 && !(_picture regexMatch ".*?\.paa")) then { // handle missing file extension
        if (!fileExists (_picture + ".paa")) exitWith {};
        _picture = _picture + ".paa";
    };

    // Handle missing file extension, as inventory returns path with extension
    if (count _picture > 0 && !(_picture regexMatch ".*?\.paa")) then {
        if (!fileExists (_picture + ".paa")) exitWith {};
        _picture = _picture + ".paa";
    };

    // Listboxes store pictures as lowercase
    [format ["%1:%2", _displayName, toLower _picture], _x]
})];

// Generate list of grenades
private _cfgThrow = configFile >> "CfgWeapons" >> "Throw";
private _grenadeList = createHashMap;

{
    _grenadeList insert [true, (getArray (_cfgThrow >> _x >> "magazines")) apply {_x call EFUNC(common,getConfigName)}, []];
} forEach getArray (_cfgThrow >> "muzzles");

uiNamespace setVariable [QGVAR(grenadesItemList), compileFinal _grenadeList];

// Generate list of medical items
private _medicalList = QUOTE(getNumber (_x >> 'scope') > 0 && {getNumber (_x >> 'ItemInfo' >> 'type') in [ARR_2(TYPE_FIRST_AID_KIT,TYPE_MEDIKIT)]}) configClasses (configFile >> "CfgWeapons");

_medicalList = _medicalList apply {configName _x};

uiNamespace setVariable [QGVAR(medicalItemList), compileFinal (_medicalList createHashMapFromArray [])];
