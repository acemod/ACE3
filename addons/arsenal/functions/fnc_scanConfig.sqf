#include "..\script_component.hpp"
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

private _configItems = [
    [IDX_VIRT_WEAPONS, createHashMapFromArray [[IDX_VIRT_PRIMARY_WEAPONS, createHashMap], [IDX_VIRT_SECONDARY_WEAPONS, createHashMap], [IDX_VIRT_HANDGUN_WEAPONS, createHashMap]]],
    [IDX_VIRT_ATTACHMENTS, createHashMapFromArray [[IDX_VIRT_OPTICS_ATTACHMENTS, createHashMap], [IDX_VIRT_FLASHLIGHT_ATTACHMENTS, createHashMap], [IDX_VIRT_MUZZLE_ATTACHMENTS, createHashMap], [IDX_VIRT_BIPOD_ATTACHMENTS, createHashMap]]]
];

_configItems = createHashMapFromArray _configItems;

for "_index" from IDX_VIRT_ITEMS_ALL to IDX_VIRT_MISC_ITEMS do {
    _configItems set [_index, createHashMap];
};

// Cache tools for separate tab
private _toolList = createHashMap;

// https://community.bistudio.com/wiki/Arma_3:_Characters_And_Gear_Encoding_Guide#Character_configuration
// https://github.com/acemod/ACE3/pull/9040#issuecomment-1597748331
private _filterFunction = toString {
    (if (isNumber (_x >> "scopeArsenal")) then {getNumber (_x >> "scopeArsenal") == 2 && {getNumber (_x >> "scope") > 0}} else {getNumber (_x >> "scope") == 2}) && {getNumber (_x >> QGVAR(hide)) != 1}
};

private _cfgWeapons = configFile >> "CfgWeapons";
private _cfgMagazines = configFile >> "CfgMagazines";
private _className = "";
private _simulationType = "";
private _configItemInfo = "";
private _hasItemInfo = false;
private _itemInfoType = 0;
private _isMiscItem = false;
private _isTool = false;

// Get weapons and other various items
{
    _className = configName _x;
    _simulationType = getText (_x >> "simulation");
    _configItemInfo = _x >> "ItemInfo";
    _hasItemInfo = isClass (_configItemInfo);
    _itemInfoType = if (_hasItemInfo) then {getNumber (_configItemInfo >> "type")} else {0};
    _isMiscItem = [_className, _x, false, true] call FUNC(isMiscItem);
    _isTool = getNumber (_x >> "ACE_isTool") isEqualTo 1;

    switch (true) do {
        // Weapon attachments
        case (
            _hasItemInfo &&
            {!_isMiscItem} &&
            {_itemInfoType in [TYPE_OPTICS, TYPE_FLASHLIGHT, TYPE_MUZZLE, TYPE_BIPOD]}
        ): {
            // Convert type to array index
            ((_configItems get IDX_VIRT_ATTACHMENTS) get ([TYPE_OPTICS, TYPE_FLASHLIGHT, TYPE_MUZZLE, TYPE_BIPOD] find _itemInfoType)) set [_className call FUNC(baseWeapon), nil];
        };
        // Headgear
        case (_itemInfoType == TYPE_HEADGEAR): {
            (_configItems get IDX_VIRT_HEADGEAR) set [_className, nil];
        };
        // Uniform
        case (_itemInfoType == TYPE_UNIFORM): {
            (_configItems get IDX_VIRT_UNIFORM) set [_className, nil];
        };
        // Vest
        case (_itemInfoType == TYPE_VEST): {
            (_configItems get IDX_VIRT_VEST) set [_className, nil];
        };
        // NVGs
        case (_simulationType == "NVGoggles"): {
            (_configItems get IDX_VIRT_NVG) set [_className, nil];
        };
        // Binos
        case (
            _simulationType == "Binocular" ||
            {_simulationType == "Weapon" && {getNumber (_x >> "type") == TYPE_BINOCULAR_AND_NVG}}
        ): {
            (_configItems get IDX_VIRT_BINO) set [_className call FUNC(baseWeapon), nil];
        };
        // Map
        case (_simulationType == "ItemMap"): {
            (_configItems get IDX_VIRT_MAP) set [_className, nil];
        };
        // Compass
        case (_simulationType == "ItemCompass"): {
            (_configItems get IDX_VIRT_COMPASS) set [_className, nil];
        };
        // Radio
        case (_simulationType == "ItemRadio"): {
            (_configItems get IDX_VIRT_RADIO) set [_className, nil];
        };
        // Watch
        case (_simulationType == "ItemWatch"): {
            (_configItems get IDX_VIRT_WATCH) set [_className, nil];
        };
        // GPS and UAV terminals
        case (
            _simulationType == "ItemGPS" ||
            {_itemInfoType == TYPE_UAV_TERMINAL}
        ): {
            (_configItems get IDX_VIRT_COMMS) set [_className, nil];
        };
        // Weapon, at the bottom to avoid adding binos
        case (
            isClass (_x >> "WeaponSlotsInfo") &&
            {getNumber (_x >> "type") != TYPE_BINOCULAR_AND_NVG}
        ): {
            switch (getNumber (_x >> "type")) do {
                case TYPE_WEAPON_PRIMARY: {
                    ((_configItems get IDX_VIRT_WEAPONS) get IDX_VIRT_PRIMARY_WEAPONS) set [_className call FUNC(baseWeapon), nil];
                };
                case TYPE_WEAPON_HANDGUN: {
                    ((_configItems get IDX_VIRT_WEAPONS) get IDX_VIRT_HANDGUN_WEAPONS) set [_className call FUNC(baseWeapon), nil];
                };
                case TYPE_WEAPON_SECONDARY: {
                    ((_configItems get IDX_VIRT_WEAPONS) get IDX_VIRT_SECONDARY_WEAPONS) set [_className call FUNC(baseWeapon), nil];
                };
            };
        };
        // Misc. items
        case (_hasItemInfo && _isMiscItem): {
            (_configItems get IDX_VIRT_MISC_ITEMS) set [_className, nil];
            if (_isTool) then {_toolList set [_className, nil]};
        };
    };
} forEach (_filterFunction configClasses _cfgWeapons);

// Get all grenades
// Explicitly don't look at scope for these, we want hidden items to be sorted as grenades/explosives properly
private _grenadeList = createHashMap;

{
    _grenadeList insert [true, (getArray (_cfgWeapons >> "Throw" >> _x >> "magazines")) apply {_x call EFUNC(common,getConfigName)}, []];
} forEach getArray (_cfgWeapons >> "Throw" >> "muzzles");

// Get all explosives, mines, IEDS and similar
private _putList = createHashMap;

{
    _putList insert [true, (getArray (_cfgWeapons >> "Put" >> _x >> "magazines")) apply {_x call EFUNC(common,getConfigName)}, []];
} forEach getArray (_cfgWeapons >> "Put" >> "muzzles");

// Get all magazine misc items
private _magazineMiscItems = createHashMap;

{
    _magazineMiscItems set [configName _x, nil];
} forEach ((toString {
    with uiNamespace do { // configClasses runs in missionNamespace even if we're in preStart apparently
        [configName _x, _x, true, true] call FUNC(isMiscItem);
    };
}) configClasses _cfgMagazines);

// Remove invalid/non-existent entries
_grenadeList deleteAt "";
_putList deleteAt "";
_magazineMiscItems deleteAt "";

// Get all other grenades, explosives (and similar) and magazines
{
    _className = configName _x;

    switch (true) do {
        // "Misc. items" magazines (e.g. spare barrels, intel, photos)
        case (_className in _magazineMiscItems): {
            (_configItems get IDX_VIRT_MISC_ITEMS) set [_className, nil];
            if (getNumber (_x >> "ACE_isTool") isEqualTo 1) then {_toolList set [_className, nil]};
        };
        // Grenades
        case (_className in _grenadeList): {
            (_configItems get IDX_VIRT_GRENADES) set [_className, nil];
        };
        // Explosives
        case (_className in _putList): {
            (_configItems get IDX_VIRT_EXPLOSIVES) set [_className, nil];
        };
        // Primary, handgun & secondary weapon magazines, and magazines that are forced with "ace_arsenal_hide = -1"
        case (
            getNumber (_x >> QGVAR(hide)) == -1 ||
            {getNumber (_x >> "type") in [TYPE_MAGAZINE_PRIMARY_AND_THROW, TYPE_MAGAZINE_SECONDARY_AND_PUT, 1536, TYPE_MAGAZINE_HANDGUN_AND_GL, TYPE_MAGAZINE_MISSILE]}
        ): {
            (_configItems get IDX_VIRT_ITEMS_ALL) set [_className, nil];
        };
    };
} forEach (_filterFunction configClasses _cfgMagazines);

// Get all backpacks
{
    if (getNumber (_x >> "isBackpack") == 1) then {
        (_configItems get IDX_VIRT_BACKPACK) set [configName _x, nil];
    };
} forEach (_filterFunction configClasses (configFile >> "CfgVehicles"));

// Get all facewear
{
    (_configItems get IDX_VIRT_GOGGLES) set [configName _x, nil];
} forEach (_filterFunction configClasses (configFile >> "CfgGlasses"));

// Get all faces
private _faceCache = createHashMap;
private _dlcName = "";
private _modPicture = "";
private _faceCategory = "";

{
    _faceCategory = configName _x;

    {
        if (getNumber (_x >> "disabled") == 0 && {getText (_x >> "head") != ""} && {configName _x != "Default"}) then {
            _dlcName = _x call EFUNC(common,getAddon);
            _modPicture = "";

            if (_dlcName != "") then {
                _modPicture = (modParams [_dlcName, ["logo"]]) param [0, ""];
            };

            _faceCache set [configName _x, [getText (_x >> "displayName"), _modPicture, _faceCategory]];
        };
    } forEach ("true" configClasses _x);
} forEach ("true" configClasses (configFile >> "CfgFaces"));

// Get all voices
private _voiceCache = ("getNumber (_x >> 'scope') == 2" configClasses (configFile >> "CfgVoice")) - [configFile >> "CfgVoice" >> "NoVoice"];
_voiceCache = _voiceCache apply {configName _x};

// Get all insignia
private _insigniaCache = "(if (isNumber (_x >> 'scope')) then {getNumber (_x >> 'scope')} else {2}) == 2" configClasses (configFile >> "CfgUnitInsignia");
_insigniaCache = _insigniaCache apply {configName _x};

// Get all disposable launchers
private _launchersConfig = configProperties [configFile >> "CBA_DisposableLaunchers"];
private _launchers = createHashMap;
private _launcher = "";

// Get the loaded launchers (used launchers aren't necessary)
{
    // Convert to config case
    _launcher = ((getArray _x) param [0, ""]) call EFUNC(common,getConfigName);

    if (_launcher != "") then {
        _launchers set [_launcher, nil];
    };
} forEach _launchersConfig;

private _configItemsFlat = +_configItems;
private _weapons = _configItemsFlat deleteAt IDX_VIRT_WEAPONS;
private _attachments = _configItemsFlat deleteAt IDX_VIRT_ATTACHMENTS;

for "_index" from IDX_VIRT_ITEMS_ALL to IDX_VIRT_MISC_ITEMS do {
    _configItemsFlat merge [_configItemsFlat deleteAt _index, true];
};

for "_index" from IDX_VIRT_PRIMARY_WEAPONS to IDX_VIRT_HANDGUN_WEAPONS do {
    _configItemsFlat merge [_weapons deleteAt _index, true];
};

for "_index" from IDX_VIRT_OPTICS_ATTACHMENTS to IDX_VIRT_BIPOD_ATTACHMENTS do {
    _configItemsFlat merge [_attachments deleteAt _index, true];
};

// This contains config case entries only
uiNamespace setVariable [QGVAR(configItems), compileFinal _configItems];
uiNamespace setVariable [QGVAR(configItemsFlat), compileFinal _configItemsFlat];
uiNamespace setVariable [QGVAR(faceCache), compileFinal _faceCache];
uiNamespace setVariable [QGVAR(voiceCache), compileFinal (_voiceCache createHashMapFromArray [])];
uiNamespace setVariable [QGVAR(insigniaCache), compileFinal (_insigniaCache createHashMapFromArray [])];
uiNamespace setVariable [QGVAR(grenadeCache), compileFinal _grenadeList];
uiNamespace setVariable [QGVAR(putCache), compileFinal _putList];
uiNamespace setVariable [QGVAR(magazineMiscItems), compileFinal _magazineMiscItems];
uiNamespace setVariable [QGVAR(CBAdisposableLaunchers), compileFinal _launchers];
uiNamespace setVariable [QGVAR(configItemsTools), compileFinal _toolList];

// Compatibility: Override baseWeapon for RHS optics
// No good way to do this via script for other RHS attachments, needs manual compat
private _baseWeaponCache = uiNamespace getVariable QGVAR(baseWeaponNameCache);
{
    private _baseAttachment = configName (_cfgWeapons >> getText (_x >> "rhs_optic_base"));
    if (_baseAttachment != "") then {
        _baseWeaponCache set [toLowerANSI configName _x, _baseAttachment];
    };
} forEach ("getText (_x >> 'rhs_optic_base') != ''" configClasses _cfgWeapons);

// Compatibility: Override baseWeapon for CBA Scripted Optics
// Adapted from https://github.com/Theseus-Aegis/Mods/blob/master/addons/armory/functions/fnc_getBaseVariant.sqf
private _isScriptedOptic = toString {
    isClass (_x >> "CBA_ScriptedOptic") ||
    {(getText (_x >> "weaponInfoType")) regexMatch "CBA_scriptedOptic.*?"}
};

{
    private _xClass = toLowerANSI configName _x;
    private _baseOptic = _xClass call FUNC(baseOptic);
    if (_baseOptic != "" && {_baseOptic != _xClass}) then {
        TRACE_2("updating baseOptic",_xClass,_baseOptic);
        _baseWeaponCache set [_xClass, _baseOptic];
    };
} forEach (_isScriptedOptic configClasses _cfgWeapons);

// Compatibility: Override baseWeapon for CBA Scripted Attachments
private _isScriptedAttachment = toString {
    getText (_x >> "MRT_SwitchItemNextClass") != "" ||
    {getText (_x >> "MRT_SwitchItemPrevClass") != ""}
};

{
    private _xClass = toLowerANSI configName _x;
    private _baseAttachment = _xClass call FUNC(baseAttachment);
    if (_baseAttachment != "" && {_baseAttachment != _xClass}) then {
        TRACE_2("updating baseAttachment",_xClass,_baseAttachment);
        _baseWeaponCache set [_xClass, _baseAttachment];
    };
} forEach (_isScriptedAttachment configClasses _cfgWeapons);
