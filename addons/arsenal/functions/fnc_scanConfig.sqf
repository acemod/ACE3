#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Dedmen, johnb43
 * Cache an array of all the compatible items for arsenals.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
*/

private _configItems = EMPTY_VIRTUAL_ARSENAL;

// https://community.bistudio.com/wiki/Arma_3:_Characters_And_Gear_Encoding_Guide#Character_configuration
// https://github.com/acemod/ACE3/pull/9040#issuecomment-1597748331
private _filterFunction = [{
    isClass _x && {(if (isNumber (_x >> "scopeArsenal")) then {getNumber (_x >> "scopeArsenal")} else {getNumber (_x >> "scope")}) == 2} && {getNumber (_x >> QGVAR(hide)) != 1}
}] call EFUNC(common,codeToString);

private _cfgWeapons = configFile >> "CfgWeapons";
private _cfgMagazines = configFile >> "CfgMagazines";
private _className = "";
private _configItemInfo = "";
private _simulationType = "";
private _hasItemInfo = false;
private _itemInfoType = 0;
private _isMiscItem = false;

// Get weapons and other various items
{
    _className = configName _x;
    _simulationType = getText (_x >> "simulation");
    _configItemInfo = _x >> "ItemInfo";
    _hasItemInfo = isClass (_configItemInfo);
    _itemInfoType = if (_hasItemInfo) then {getNumber (_configItemInfo >> "type")} else {0};
    _isMiscItem = _className isKindOf ["CBA_MiscItem", _cfgWeapons];

    switch (true) do {
        // Weapon attachments
        case (
            _hasItemInfo &&
            {!_isMiscItem} &&
            {_itemInfoType in [TYPE_OPTICS, TYPE_FLASHLIGHT, TYPE_MUZZLE, TYPE_BIPOD]}
        ): {
            // Convert type to array index
            ((_configItems select IDX_VIRT_ATTACHMENTS) select ([TYPE_OPTICS, TYPE_FLASHLIGHT, TYPE_MUZZLE, TYPE_BIPOD] find _itemInfoType)) pushBackUnique _className;
        };
        // Headgear
        case (_itemInfoType == TYPE_HEADGEAR): {
            (_configItems select IDX_VIRT_HEADGEAR) pushBackUnique _className;
        };
        // Uniform
        case (_itemInfoType == TYPE_UNIFORM): {
            (_configItems select IDX_VIRT_UNIFORM) pushBackUnique _className;
        };
        // Vest
        case (_itemInfoType == TYPE_VEST): {
            (_configItems select IDX_VIRT_VEST) pushBackUnique _className;
        };
        // NVgs
        case (_simulationType == "NVGoggles"): {
            (_configItems select IDX_VIRT_NVG) pushBackUnique _className;
        };
        // Binos
        case (
            _simulationType == "Binocular" ||
            {_simulationType == "Weapon" && {getNumber (_x >> "type") == TYPE_BINOCULAR_AND_NVG}}
        ): {
            (_configItems select IDX_VIRT_BINO) pushBackUnique _className;
        };
        // Map
        case (_simulationType == "ItemMap"): {
            (_configItems select IDX_VIRT_MAP) pushBackUnique _className;
        };
        // Compass
        case (_simulationType == "ItemCompass"): {
            (_configItems select IDX_VIRT_COMPASS) pushBackUnique _className;
        };
        // Radio//
        case (_simulationType == "ItemRadio"): {
            (_configItems select IDX_VIRT_RADIO) pushBackUnique _className;
        };
        // Watch
        case (_simulationType == "ItemWatch"): {
            (_configItems select IDX_VIRT_WATCH) pushBackUnique _className;
        };
        // GPS and UAV terminals
        case (
            _simulationType == "ItemGPS" ||
            {_itemInfoType == TYPE_UAV_TERMINAL}
        ): {
            (_configItems select IDX_VIRT_COMMS) pushBackUnique _className;
        };
        // Weapon, at the bottom to avoid adding binos
        case (
            isClass (_x >> "WeaponSlotsInfo") &&
            {getNumber (_x >> "type") != TYPE_BINOCULAR_AND_NVG}
        ): {
            switch (getNumber (_x >> "type")) do {
                case TYPE_WEAPON_PRIMARY: {
                    ((_configItems select IDX_VIRT_WEAPONS) select IDX_VIRT_PRIMARY_WEAPONS) pushBackUnique (_className call FUNC(baseWeapon));
                };
                case TYPE_WEAPON_HANDGUN: {
                    ((_configItems select IDX_VIRT_WEAPONS) select IDX_VIRT_HANDGUN_WEAPONS) pushBackUnique (_className call FUNC(baseWeapon));
                };
                case TYPE_WEAPON_SECONDARY: {
                    ((_configItems select IDX_VIRT_WEAPONS) select IDX_VIRT_SECONDARY_WEAPONS) pushBackUnique (_className call FUNC(baseWeapon));
                };
            };
        };
        // Misc items
        case (
            _hasItemInfo &&
            {_itemInfoType in [TYPE_OPTICS, TYPE_FLASHLIGHT, TYPE_MUZZLE, TYPE_BIPOD] &&
            {_isMiscItem}} ||
            {_itemInfoType in [TYPE_FIRST_AID_KIT, TYPE_MEDIKIT, TYPE_TOOLKIT]} ||
            {getText (_x >> "simulation") == "ItemMineDetector"}
        ): {
            (_configItems select IDX_VIRT_MISC_ITEMS) pushBackUnique _className;
        };
    };
} forEach configProperties [_cfgWeapons, _filterFunction, true];

// Get all grenades
private _grenadeList = [];

{
    _grenadeList append getArray (_cfgWeapons >> "Throw" >> _x >> "magazines");
} forEach getArray (_cfgWeapons >> "Throw" >> "muzzles");

// Get all explosives, mines, IEDS and similar
private _putList = [];

{
    _putList append getArray (_cfgWeapons >> "Put" >> _x >> "magazines");
} forEach getArray (_cfgWeapons >> "Put" >> "muzzles");

// Convert both lists to config case
_grenadeList = _grenadeList apply {_x call EFUNC(common,getConfigName)};
_putList = _putList apply {_x call EFUNC(common,getConfigName)};

// Remove invalid/non-existent entries
_grenadeList = _grenadeList - [""];
_putList = _putList - [""];

// Get all other grenades, explosives (and similar) and magazines
{
    _className = configName _x;

    switch (true) do {
        // Grenades
        case (_className in _grenadeList): {
            (_configItems select IDX_VIRT_GRENADES) pushBackUnique _className;
        };
        // Explosives
        case (_className in _putList): {
            (_configItems select IDX_VIRT_EXPLOSIVES) pushBackUnique _className;
        };
        // Primary, handgun & secondary weapon magazines, and magazines that are forced with "ace_arsenal_hide = -1"
        case (
            getNumber (_x >> QGVAR(hide)) == -1 ||
            {getNumber (_x >> "type") in [TYPE_MAGAZINE_PRIMARY_AND_THROW, TYPE_MAGAZINE_SECONDARY_AND_PUT, 1536, TYPE_MAGAZINE_HANDGUN_AND_GL, TYPE_MAGAZINE_MISSILE]}
        ): {
            (_configItems select IDX_VIRT_ITEMS_ALL) pushBackUnique _className;
        };
    };
} forEach configProperties [_cfgMagazines, _filterFunction, true];

// Get all backpacks
{
    if (getNumber (_x >> "isBackpack") == 1) then {
        (_configItems select IDX_VIRT_BACKPACK) pushBackUnique (configName _x);
    };
} forEach configProperties [configFile >> "CfgVehicles", _filterFunction, true];

// Get all facewear
{
    (_configItems select IDX_VIRT_GOGGLES) pushBackUnique (configName _x);
} forEach configProperties [configFile >> "CfgGlasses", _filterFunction, true];

// Get all faces
private _faceCache = createHashMap;
private _dlcName = "";
private _modPicture = "";

{
    {
        if (getNumber (_x >> "disabled") == 0 && {getText (_x >> "head") != ""} && {configName _x != "Default"}) then {
            _dlcName = _x call EFUNC(common,getAddon);

            _modPicture = "";

            if (_dlcName != "") then {
                _modPicture = (modParams [_dlcName, ["logo"]]) param [0, ""];
            };

            _faceCache set [configName _x, [getText (_x >> "displayName"), _modPicture]];
        };
    } forEach ("true" configClasses _x);
} forEach ("true" configClasses (configfile >> "CfgFaces"));

// Get all voices
private _voiceCache = (configProperties [configFile >> "CfgVoice", "isClass _x && {getNumber (_x >> 'scope') == 2}", true]) - [configfile >> "CfgVoice" >> "NoVoice"];

// Get all insignia
private _insigniaCache = "true" configClasses (configFile >> "CfgUnitInsignia");

// This contains config case entries only
uiNamespace setVariable [QGVAR(configItems), _configItems];
uiNamespace setVariable [QGVAR(configItemsFlat), flatten _configItems];
uiNamespace setVariable [QGVAR(faceCache), _faceCache];
uiNamespace setVariable [QGVAR(voiceCache), _voiceCache];
uiNamespace setVariable [QGVAR(insigniaCache), _insigniaCache];
uiNamespace setVariable [QGVAR(grenadeCache), _grenadeList];
uiNamespace setVariable [QGVAR(putCache), _putList];
