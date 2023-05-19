#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, Dedmen, johnb43
 * Add virtual items to the provided target.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Items <ARRAY of STRINGS> <BOOL>
 * 2: Add globally <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [_box, ["item1", "item2", "itemN"]] call ace_arsenal_fnc_addVirtualItems
 * [_box, true, false] call ace_arsenal_fnc_addVirtualItems
 *
 * Public: Yes
*/

params [["_object", objNull, [objNull]], ["_items", [], [true, []]], ["_global", false, [false]]];

if (isNull _object || {_items isEqualTo []}) exitWith {};

private _cargo = _object getVariable [QGVAR(virtualItems), EMPTY_VIRTUAL_ARSENAL];

// If passed arguement is "true", add all items
if (_items isEqualType true) then {
    if (_items) then {
        private _weapons = _cargo select IDX_VIRT_WEAPONS;
        private _weaponAttachments = _cargo select IDX_VIRT_ATTACHMENTS;
        private _configItems = uiNamespace getVariable QGVAR(configItems);

        // Add onto existing items, in case some items that were already added aren't available by default in the arsenal
        {
            (_x select 0) append (_x select 1);
            (_x select 2) set [_x select 3, (_x select 0) arrayIntersect (_x select 0)];
        } forEach [
            [_weapons select IDX_VIRT_PRIMARY_WEAPONS, _configItems select IDX_VIRT_WEAPONS select IDX_VIRT_PRIMARY_WEAPONS, _weapons, IDX_VIRT_PRIMARY_WEAPONS],
            [_weapons select IDX_VIRT_SECONDARY_WEAPONS, _configItems select IDX_VIRT_WEAPONS select IDX_VIRT_SECONDARY_WEAPONS, _weapons, IDX_VIRT_SECONDARY_WEAPONS],
            [_weapons select IDX_VIRT_HANDGUN_WEAPONS, _configItems select IDX_VIRT_WEAPONS select IDX_VIRT_HANDGUN_WEAPONS, _weapons, IDX_VIRT_HANDGUN_WEAPONS],
            [_weaponAttachments select IDX_VIRT_OPTICS_ATTACHMENTS, _configItems select IDX_VIRT_ATTACHMENTS select IDX_VIRT_OPTICS_ATTACHMENTS, _weaponAttachments, IDX_VIRT_OPTICS_ATTACHMENTS],
            [_weaponAttachments select IDX_VIRT_FLASHLIGHT_ATTACHMENTS, _configItems select IDX_VIRT_ATTACHMENTS select IDX_VIRT_FLASHLIGHT_ATTACHMENTS, _weaponAttachments, IDX_VIRT_FLASHLIGHT_ATTACHMENTS],
            [_weaponAttachments select IDX_VIRT_MUZZLE_ATTACHMENTS, _configItems select IDX_VIRT_ATTACHMENTS select IDX_VIRT_MUZZLE_ATTACHMENTS, _weaponAttachments, IDX_VIRT_MUZZLE_ATTACHMENTS],
            [_weaponAttachments select IDX_VIRT_BIPOD_ATTACHMENTS, _configItems select IDX_VIRT_ATTACHMENTS select IDX_VIRT_BIPOD_ATTACHMENTS, _weaponAttachments, IDX_VIRT_BIPOD_ATTACHMENTS]
        ];

        // Add onto existing items, in case some items that were already added aren't available by default in the arsenal
        for "_index" from IDX_VIRT_ITEMS_ALL to IDX_VIRT_MISC_ITEMS do {
            (_cargo select _index) append (_configItems select _index);
            _cargo set [_index, (_cargo select _index) arrayIntersect (_cargo select _index)];
        };
    };
} else {
    // Make sure all items are in string form, then convert to config case (non-existent items return "")
    _items = (_items select {_x isEqualType ""}) apply {_x call EFUNC(common,getConfigName)};

    // Remove any invalid/non-existing items
    _items = _items - [""];

    private _configItemInfo = "";
    private _simulationType = "";
    private _hasItemInfo = false;

    private _cfgWeapons = configFile >> "CfgWeapons";
    private _cfgMagazines = configFile >> "CfgMagazines";
    private _cfgVehicles = configFile >> "CfgVehicles";
    private _cfgGlasses = configFile >> "CfgGlasses";

    private _grenadeList = uiNamespace getVariable [QGVAR(grenadeCache), []];
    private _putList = uiNamespace getVariable [QGVAR(putCache), []];

    // _items can contain classNames with scope < 2, which aren't necessarily in the arsenal cache
    {
        _configItemInfo = _cfgWeapons >> _x >> "ItemInfo";
        _simulationType = getText (_cfgWeapons >> _x >> "simulation");
        _hasItemInfo = isClass (_configItemInfo);

        switch (true) do {
            case (isClass (_cfgWeapons >> _x)): {
                switch (true) do {
                    // Weapon attachments
                    case (
                        _hasItemInfo &&
                        {getNumber (_configItemInfo >> "type") in [TYPE_OPTICS, TYPE_FLASHLIGHT, TYPE_MUZZLE, TYPE_BIPOD]} &&
                        {!(_x isKindOf ["CBA_MiscItem", _cfgWeapons])}
                    ): {
                        switch (getNumber (_configItemInfo >> "type")) do {
                            case TYPE_OPTICS: {
                                ((_cargo select IDX_VIRT_ATTACHMENTS) select IDX_VIRT_OPTICS_ATTACHMENTS) pushBackUnique _x;
                            };
                            case TYPE_FLASHLIGHT: {
                                ((_cargo select IDX_VIRT_ATTACHMENTS) select IDX_VIRT_FLASHLIGHT_ATTACHMENTS) pushBackUnique _x;
                            };
                            case TYPE_MUZZLE: {
                                ((_cargo select IDX_VIRT_ATTACHMENTS) select IDX_VIRT_MUZZLE_ATTACHMENTS) pushBackUnique _x;
                            };
                            case TYPE_BIPOD: {
                                ((_cargo select IDX_VIRT_ATTACHMENTS) select IDX_VIRT_BIPOD_ATTACHMENTS) pushBackUnique _x;
                            };
                        };
                    };
                    // Headgear
                    case (
                        _hasItemInfo &&
                        {getNumber (_configItemInfo >> "type") == TYPE_HEADGEAR}
                    ): {
                        (_cargo select IDX_VIRT_HEADGEAR) pushBackUnique _x;
                    };
                    // Uniforms
                    case (
                        _hasItemInfo &&
                        {getNumber (_configItemInfo >> "type") == TYPE_UNIFORM}
                    ): {
                        (_cargo select IDX_VIRT_UNIFORM) pushBackUnique _x;
                    };
                    // Vests
                    case (
                        _hasItemInfo &&
                        {getNumber (_configItemInfo >> "type") == TYPE_VEST}
                    ): {
                        (_cargo select IDX_VIRT_VEST) pushBackUnique _x;
                    };
                    // NVGs
                    case (_simulationType == "NVGoggles"): {
                        (_cargo select IDX_VIRT_NVG) pushBackUnique _x;
                    };
                    // Binoculars
                    case (
                        _simulationType == "Binocular" ||
                        {_simulationType == "Weapon" && {getNumber (_cfgWeapons >> _x >> "type") == TYPE_BINOCULAR_AND_NVG}}
                    ): {
                        (_cargo select IDX_VIRT_BINO) pushBackUnique _x;
                    };
                    // Maps
                    case (_simulationType == "ItemMap"): {
                        (_cargo select IDX_VIRT_MAP) pushBackUnique _x;
                    };
                    // Compasses
                    case (_simulationType == "ItemCompass"): {
                        (_cargo select IDX_VIRT_COMPASS) pushBackUnique _x;
                    };
                    // Radios
                    case (_simulationType == "ItemRadio"): {
                        (_cargo select IDX_VIRT_RADIO) pushBackUnique _x;
                    };
                    // Watches
                    case (_simulationType == "ItemWatch"): {
                        (_cargo select IDX_VIRT_WATCH) pushBackUnique _x;
                    };
                    // GPS and UAV Terminals
                    case (
                        _simulationType == "ItemGPS" ||
                        {_hasItemInfo &&
                        {getNumber (_configItemInfo >> "type") == TYPE_UAV_TERMINAL}}
                    ): {
                        (_cargo select IDX_VIRT_COMMS) pushBackUnique _x;
                    };
                    // Weapons, at the bottom to avoid adding binos
                    case (
                        isClass (_cfgWeapons >> _x >> "WeaponSlotsInfo") &&
                        {getNumber (_cfgWeapons >> _x >> "type") != TYPE_BINOCULAR_AND_NVG}
                    ): {
                        switch (getNumber (_cfgWeapons >> _x >> "type")) do {
                            case TYPE_WEAPON_PRIMARY: {
                                ((_cargo select IDX_VIRT_WEAPONS) select IDX_VIRT_PRIMARY_WEAPONS) pushBackUnique (_x call EFUNC(common,baseWeapon));
                            };
                            case TYPE_WEAPON_HANDGUN: {
                                ((_cargo select IDX_VIRT_WEAPONS) select IDX_VIRT_HANDGUN_WEAPONS) pushBackUnique (_x call EFUNC(common,baseWeapon));
                            };
                            case TYPE_WEAPON_SECONDARY: {
                                ((_cargo select IDX_VIRT_WEAPONS) select IDX_VIRT_SECONDARY_WEAPONS) pushBackUnique (_x call EFUNC(common,baseWeapon));
                            };
                        };
                    };
                    // Misc. items
                    case (
                        _hasItemInfo &&
                        {getNumber (_configItemInfo >> "type") in [TYPE_MUZZLE, TYPE_OPTICS, TYPE_FLASHLIGHT, TYPE_BIPOD] &&
                        {_x isKindOf ["CBA_MiscItem", _cfgWeapons]}} ||
                        {getNumber (_configItemInfo >> "type") in [TYPE_FIRST_AID_KIT, TYPE_MEDIKIT, TYPE_TOOLKIT]} ||
                        {getText (_cfgWeapons >> _x >> "simulation") == "ItemMineDetector"}
                    ): {
                        (_cargo select IDX_VIRT_MISC_ITEMS) pushBackUnique _x;
                    };
                };
            };
            case (isClass (_cfgMagazines >> _x)): {
                // Check what type the magazine actually is
                switch (true) do {
                    // Grenades
                    case (_x in _grenadeList): {
                        (_cargo select IDX_VIRT_GRENADES) pushBackUnique _x;
                    };
                    // Explosives
                    case (_x in _putList): {
                        (_cargo select IDX_VIRT_EXPLOSIVES) pushBackUnique _x;
                    };
                    // Primary, handgun & secondary weapon magazines, and magazines that are forced with "ace_arsenal_hide = -1"
                    case (
                        getNumber (_cfgMagazines >> _x >> QGVAR(hide)) == -1 ||
                        {getNumber (_cfgMagazines >> _x >> "type") in [TYPE_MAGAZINE_PRIMARY_AND_THROW, TYPE_MAGAZINE_SECONDARY_AND_PUT, 1536, TYPE_MAGAZINE_HANDGUN_AND_GL]}
                    ): {
                        (_cargo select IDX_VIRT_ITEMS_ALL) pushBackUnique _x;
                    };
                };
            };
            // Backpacks
            case (isClass (_cfgVehicles >> _x)): {
                if (getNumber (_cfgVehicles >> _x >> "isBackpack") == 1) then {
                    (_cargo select IDX_VIRT_BACKPACK) pushBackUnique _x;
                };
            };
            // Goggles
            case (isClass (_cfgGlasses >> _x)): {
                (_cargo select IDX_VIRT_GOGGLES) pushBackUnique _x;
            };
        };
    } forEach _items;
};

_object setVariable [QGVAR(virtualItems), _cargo, _global];
