#include "script_component.hpp"
#include "..\defines.hpp"

params [["_object", objNull, [objNull]], ["_items", [], [[""]]], ["_global", false, [false]]];

if (_object == objNull) exitWith {};
if (count _items == 0) exitWith {};

private _cargo = _object getVariable [QGVAR(virtualItems), [
    [ ], // Weapons 0
    [ ], // WeaponAccessories 1
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


if (count _items == 1 && {(_items select 0)}) then {
    {
        switch true do {
            /* Weapon acc */
            case (
                    isClass (_x >> "ItemInfo") &&
                    {(getNumber (_x >> "ItemInfo" >> "type")) in [101, 201, 301, 302]} &&
                    {!(configName _x isKindOf ["CBA_MiscItem", (configFile >> "CfgWeapons")])}
                ): {
                (_cargo select 1) pushBackUnique (configName  _x);
            };
            /* Headgear */
            case (isClass (_x >> "ItemInfo") && {getNumber (_x >> "ItemInfo" >> "type") == 605}): {
                (_cargo select 3) pushBackUnique (configName  _x);
            };
            /* Uniform */\
            case (isClass (_x >> "ItemInfo") && {getNumber (_x >> "ItemInfo" >> "type") == 801}): {
                (_cargo select 4) pushBackUnique (configName  _x);
            };
            /* Vest */
            case (isClass (_x >> "ItemInfo") && {getNumber (_x >> "ItemInfo" >> "type") == 701}): {
                (_cargo select 5) pushBackUnique (configName  _x);
            };
            /* NVgs */
            case (getText (_x >> "simulation") == "NVGoggles"): {
                (_cargo select 8) pushBackUnique (configName  _x);
            };
            /* Binos */
            case (getText (_x >> "simulation") == "Binocular" || 
            ((getText (_x >> 'simulation') == 'Weapon') && {(getNumber (_x >> 'type') == 4096)})): {
                (_cargo select 9) pushBackUnique (configName  _x);
            };
            /* Map */
            case (getText (_x >> "simulation") == "ItemMap"): {
                (_cargo select 10) pushBackUnique (configName  _x);
            };
            /* Compass */
            case (getText (_x >> "simulation") == "ItemCompass"): {
                (_cargo select 11) pushBackUnique (configName  _x);
            };
            /* Radio */
            case (getText (_x >> "simulation") == "ItemRadio"): {
                (_cargo select 12) pushBackUnique (configName  _x);
            };
            /* Watch */
            case (getText (_x >> "simulation") == "ItemWatch"): {
                (_cargo select 13) pushBackUnique (configName  _x);
            };
            /* GPS */
            case (getText (_x >> "simulation") == "ItemGPS"): {
                (_cargo select 14) pushBackUnique (configName  _x);
            };
            /* UAV terminals */
            case (isClass (_x >> "ItemInfo") && {getNumber (_x >> "ItemInfo" >> "type") == 621}): {
                (_cargo select 14) pushBackUnique (configName  _x);
            };
            /* Weapon, at the bottom to avoid adding binos */
            case (isClass (_x >> "WeaponSlotsInfo") &&
                {getNumber (_x >> 'type') != 4096}): {
                (_cargo select 0) pushBackUnique (configName  _x);
            };
            /* Misc items */
            case (
                    isClass (_x >> "ItemInfo") &&
                    ((getNumber (_x >> "ItemInfo" >> "type")) in [101, 201, 301, 302] &&
                    {(configName _x isKindOf ["CBA_MiscItem", (configFile >> "CfgWeapons")])}) ||
                    {(getNumber (_x >> "ItemInfo" >> "type")) in [401, 619, 620]}
                ): {
                (_cargo select 17) pushBackUnique (configName  _x);
            };
        };
    } foreach (configProperties [configFile >> "CfgWeapons", "isClass _x && {getNumber (_x >> 'scope') == 2}", true]);

    {
    } foreach configProperties [(configFile >> "CfgMagazines"), "isClass _x && {getNumber (_x >> 'scope') == 2}", true];

    {
        if (getText (_x >> "vehicleClass") == "Backpacks") then {
            (_cargo select 6) pushBackUnique (configName  _x);
        };
    } foreach configProperties [(configFile >> "CfgVehicles"), "isClass _x && {getNumber (_x >> 'scope') == 2}", true];

    {
        (_cargo select 7) pushBackUnique (configName  _x);
    } foreach configProperties [(configFile >> "CfgGlasses"), "isClass _x && {getNumber (_x >> 'scope') == 2}", true];
} else {

    {
        if (typeName _x == typeName "") then {
            switch true do {
                case (isClass (configFile >> "CfgWeapons" >> _x)): {
                    switch true do {
                        /* Weapon acc */
                        case (
                                isClass (configFile >> "CfgWeapons" >> _x >> "ItemInfo") &&
                                {(getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "type")) in [101, 201, 301, 302]} &&
                                {!(_x isKindOf ["CBA_MiscItem", (configFile >> "CfgWeapons")])}
                            ): {
                            (_cargo select 1) pushBackUnique _x;
                        };
                        /* Headgear */
                        case (isClass (configFile >> "CfgWeapons" >> _x >> "ItemInfo") && 
                            {getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "type") == 605}): {
                            (_cargo select 3) pushBackUnique _x;
                        };
                        /* Uniform */\
                        case (isClass (configFile >> "CfgWeapons" >> _x >> "ItemInfo") && 
                            {getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "type") == 801}): {
                            (_cargo select 4) pushBackUnique _x;
                        };
                        /* Vest */
                        case (isClass (configFile >> "CfgWeapons" >> _x >> "ItemInfo") && 
                            {getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "type") == 701}): {
                            (_cargo select 5) pushBackUnique _x;
                        };
                        /* NVgs */
                        case (getText (configFile >> "CfgWeapons" >> _x >> "simulation") == "NVGoggles"): {
                            (_cargo select 8) pushBackUnique _x;
                        };
                        /* Binos */
                        case (getText (configFile >> "CfgWeapons" >> _x >> "simulation") == "Binocular" || 
                            ((getText (configFile>> "CfgWeapons" >> _x >> 'simulation') == 'Weapon') && {(getNumber (configFile>> "CfgWeapons" >> _x >> 'type') == 4096)})): {
                            (_cargo select 9) pushBackUnique _x;
                        };
                        /* Map */
                        case (getText (configFile >> "CfgWeapons" >> _x >> "simulation") == "ItemMap"): {
                            (_cargo select 10) pushBackUnique _x;
                        };
                        /* Compass */
                        case (getText (configFile >> "CfgWeapons" >> _x >> "simulation") == "ItemCompass"): {
                            (_cargo select 11) pushBackUnique _x;
                        };
                        /* Radio */
                        case (getText (configFile >> "CfgWeapons" >> _x >> "simulation") == "ItemRadio"): {
                            (_cargo select 12) pushBackUnique _x;
                        };
                        /* Watch */
                        case (getText (configFile >> "CfgWeapons" >> _x >> "simulation") == "ItemWatch"): {
                            (_cargo select 13) pushBackUnique _x;
                        };
                        /* GPS */
                        case (getText (configFile >> "CfgWeapons" >> _x >> "simulation") == "ItemGPS"): {
                            (_cargo select 14) pushBackUnique _x;
                        };
                        /* UAV terminals */
                        case (isClass (configFile >> "CfgWeapons" >> _x >> "ItemInfo") && 
                            {getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "type") == 621}): {
                            (_cargo select 14) pushBackUnique _x;
                        };
                        /* Weapon, at the bottom to avoid adding binos */
                        case (isClass (configFile >> "CfgWeapons" >> _x >> "WeaponSlotsInfo") && 
                            {getNumber (configFile>> "CfgWeapons" >> _x >> 'type') != 4096}): {
                            (_cargo select 0) pushBackUnique _x;
                        };
                        /* Misc items */
                        case (
                                isClass (configFile >> "CfgWeapons" >> _x >> "ItemInfo") &&
                                ((getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "type")) in [101, 201, 301, 302] &&
                                {(_x isKindOf ["CBA_MiscItem", (configFile >> "CfgWeapons")])}) ||
                                {(getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "type")) in [401, 619, 620]}
                            ): {
                            (_cargo select 17) pushBackUnique _x;
                        };
                    };
                };
                case (isClass (configFile >> "CfgMagazines" >> _x)): {
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

for "_testVar" from 0 to (count _cargo) do {
    private _output = _cargo select _testVar;
    diag_log _output;
};
