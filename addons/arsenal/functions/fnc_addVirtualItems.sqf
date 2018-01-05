/*
 * Author: Alganthe, Dedmen
 * Add virtual items to the provided target.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Items <ARRAY of strings> <BOOL>
 * 2: Add globally <BOOL>
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
#include "script_component.hpp"
#include "..\defines.hpp"

params [["_object", objNull, [objNull]], ["_items", [], [true, []]], ["_global", false, [false]]];

if (_object == objNull) exitWith {};
if (_items isEqualType [] && {count _items == 0}) exitWith {};

private _cargo = _object getVariable [QGVAR(virtualItems), [
    [[], [], []], // Weapons 0, primary, secondary, handgun
    [[], [], [], []], // WeaponAccessories 1, optic,side,muzzle,bipod
    [ ], // Magazines 2
    [ ], // Headgear 3
    [ ], // Uniform 4
    [ ], // Vest 5
    [ ], // Backpacks 6
    [ ], // Goggles 7
    [ ], // NVGs 8
    [ ], // Binoculars 9
    [ ], // Map 10
    [ ], // Compass 11
    [ ], // Radio slot 12
    [ ], // Watch slot  13
    [ ], // Comms slot 14
    [ ], // WeaponThrow 15
    [ ], // WeaponPut 16
    [ ] // InventoryItems 17
]];

private _configCfgWeapons = configFile >> "CfgWeapons"; //Save this lookup in variable for perf improvement

if (_items isEqualType true) then {
    if (_items) then {
        private _configItems = uiNamespace getVariable QGVAR(configItems);

        {
            (_x select 0) append (_x select 1);
            (_x select 2) set [(_x select 3), (_x select 0) arrayIntersect (_x select 0)];
        } forEach [
            [(_cargo select 0 select 0),(_configItems select 0 select 0), _cargo select 0, 0],
            [(_cargo select 0 select 1),(_configItems select 0 select 1), _cargo select 0, 1],
            [(_cargo select 0 select 2),(_configItems select 0 select 2), _cargo select 0, 2],
            [(_cargo select 1 select 0),(_configItems select 1 select 0), _cargo select 1, 0],
            [(_cargo select 1 select 1),(_configItems select 1 select 1), _cargo select 1, 1],
            [(_cargo select 1 select 2),(_configItems select 1 select 2), _cargo select 1, 2],
            [(_cargo select 1 select 3),(_configItems select 1 select 3), _cargo select 1, 3]
        ];

        for "_index" from 2 to 17 do {
            (_cargo select _index) append (_configItems select _index);
            _cargo set [_index, (_cargo select _index) arrayIntersect (_cargo select _index)];
        };
    };

} else {
    {
        if (_x isEqualType "") then {
            private _configItemInfo = _configCfgWeapons >> _x >> "ItemInfo";
            private _simulationType = getText (_configCfgWeapons >> _x >> "simulation");
            switch true do {
                case (isClass (_configCfgWeapons >> _x)): {
                    switch true do {
                        /* Weapon acc */
                        case (
                                isClass (_configItemInfo) &&
                                {(getNumber (_configItemInfo >> "type")) in [101, 201, 301, 302]} &&
                                {!(_x isKindOf ["CBA_MiscItem", (_configCfgWeapons)])}
                            ): {
                            switch (getNumber (_configItemInfo >> "type")) do {
                                case 201: {
                                    (_cargo select 1) select 0 pushBackUnique _x;
                                };
                                case 301: {
                                    (_cargo select 1) select 1 pushBackUnique _x;
                                };
                                case 101: {
                                    (_cargo select 1) select 2 pushBackUnique _x;
                                };
                                case 302: {
                                    (_cargo select 1) select 3 pushBackUnique _x;
                                };
                            };
                        };
                        /* Headgear */
                        case (isClass (_configItemInfo) &&
                            {getNumber (_configItemInfo >> "type") == 605}): {
                            (_cargo select 3) pushBackUnique _x;
                        };
                        /* Uniform */
                        case (isClass (_configItemInfo) &&
                            {getNumber (_configItemInfo >> "type") == 801}): {
                            (_cargo select 4) pushBackUnique _x;
                        };
                        /* Vest */
                        case (isClass (_configItemInfo) &&
                            {getNumber (_configItemInfo >> "type") == 701}): {
                            (_cargo select 5) pushBackUnique _x;
                        };
                        /* NVgs */
                        case (_simulationType == "NVGoggles"): {
                            (_cargo select 8) pushBackUnique _x;
                        };
                        /* Binos */
                        case (_simulationType == "Binocular" ||
                            {(_simulationType == 'Weapon') && {(getNumber (_configCfgWeapons >> _x >> 'type') == 4096)}}): {
                            (_cargo select 9) pushBackUnique _x;
                        };
                        /* Map */
                        case (_simulationType == "ItemMap"): {
                            (_cargo select 10) pushBackUnique _x;
                        };
                        /* Compass */
                        case (_simulationType == "ItemCompass"): {
                            (_cargo select 11) pushBackUnique _x;
                        };
                        /* Radio */
                        case (_simulationType == "ItemRadio"): {
                            (_cargo select 12) pushBackUnique _x;
                        };
                        /* Watch */
                        case (_simulationType == "ItemWatch"): {
                            (_cargo select 13) pushBackUnique _x;
                        };
                        /* GPS */
                        case (_simulationType == "ItemGPS"): {
                            (_cargo select 14) pushBackUnique _x;
                        };
                        /* UAV terminals */
                        case (isClass (_configItemInfo) &&
                            {getNumber (_configItemInfo >> "type") == 621}): {
                            (_cargo select 14) pushBackUnique _x;
                        };
                        /* Weapon, at the bottom to avoid adding binos */
                        case (isClass (_configCfgWeapons >> _x >> "WeaponSlotsInfo") &&
                            {getNumber (_configCfgWeapons >> _x >> 'type') != 4096}): {
                            switch (getNumber (_configCfgWeapons >> _x >> "type")) do {
                                case 1: {
                                    (_cargo select 0) select 0 pushBackUnique  ([_x] call bis_fnc_baseWeapon);
                                };
                                case 2: {
                                    (_cargo select 0) select 2 pushBackUnique ([_x] call bis_fnc_baseWeapon);
                                };
                                case 4: {
                                    (_cargo select 0) select 1 pushBackUnique ([_x] call bis_fnc_baseWeapon);
                                };
                            };
                        };
                        /* Misc items */
                        case (
                                isClass (_configItemInfo) &&
                                ((getNumber (_configItemInfo >> "type")) in [101, 201, 301, 302] &&
                                {(_x isKindOf ["CBA_MiscItem", (_configCfgWeapons)])}) ||
                                {(getNumber (_configItemInfo >> "type")) in [401, 619, 620]} ||
                                {(getText (_configCfgWeapons >> _x >> "simulation")) == "ItemMineDetector"}
                            ): {
                            (_cargo select 17) pushBackUnique _x;
                        };
                    };
                };
                case (isClass (configFile >> "CfgMagazines" >> _x)): {
                    // Lists to check against
                    private _grenadeList = [];
                    {
                        _grenadeList append getArray (_configCfgWeapons >> "Throw" >> _x >> "magazines");
                        false
                    } count getArray (_configCfgWeapons >> "Throw" >> "muzzles");

                    private _putList = [];
                    {
                        _putList append getArray (_configCfgWeapons >> "Put" >> _x >> "magazines");
                        false
                    } count getArray (_configCfgWeapons >> "Put" >> "muzzles");

                    // Check what the magazine actually is
                    switch true do {
                        // Rifle, handgun, secondary weapons mags
                        case (
                                (getNumber (configFile >> "CfgMagazines" >> _x >> "type") in [256,512,1536,16]) &&
                                {!(_x in _grenadeList)} &&
                                {!(_x in _putList)}
                            ): {
                            (_cargo select 2) pushBackUnique _x;
                        };
                        // Grenades
                        case (_x in _grenadeList): {
                            (_cargo select 15) pushBackUnique _x;
                        };
                        // Put
                        case (_x in _putList): {
                            (_cargo select 16) pushBackUnique _x;
                        };
                    };
                };
                case (isClass (configFile >> "CfgVehicles" >> _x)): {
                    if (getText (configFile >> "CfgVehicles" >> _x >> "vehicleClass") == "Backpacks") then {
                        (_cargo select 6) pushBackUnique _x;
                    };
                };
                case (isClass (configFile >> "CfgGlasses" >> _x)): {
                    (_cargo select 7) pushBackUnique _x;
                };
            };
        };
    } foreach _items;
};

_object setVariable [QGVAR(virtualItems), _cargo, _global];
