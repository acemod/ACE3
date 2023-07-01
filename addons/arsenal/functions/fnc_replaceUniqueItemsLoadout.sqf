#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: johnb43
 * Replaces unique items in a loadout with their base items. Weapons are replaced with their base weapon.
 *
 * Arguments:
 * 0: CBA extended loadout or getUnitLoadout array <ARRAY>
 *
 * Return Value:
 * Sanitised loadout <ARRAY> (getUnitLoadout array)
 *
 * Example:
 * [getUnitLoadout player] call ace_arsenal_fnc_replaceUniqueItemsLoadout
 *
 * Public: Yes
*/

params [["_loadout", [], [[]]]];

// IF CBA extended loadout, just take getUnitLoadout array
if (count _loadout == 2) then {
    _loadout = _loadout select 0;
};

if (count _loadout != 10) exitWith {[]};

private _weapon = "";
private _weaponsInfo = [];
private _uniqueBaseCfgText = "";
private _cfgWeapons = configFile >> "CfgWeapons";
private _cfgMagazines = configFile >> "CfgMagazines";
private _cfgVehicles = configFile >> "CfgVehicles";

{
    switch (_forEachIndex) do {
        // Primary weapon, Secondary weapon, Handgun weapon, Binoculars
        case IDX_LOADOUT_PRIMARY_WEAPON;
        case IDX_LOADOUT_SECONDARY_WEAPON;
        case IDX_LOADOUT_HANDGUN_WEAPON;
        case IDX_LOADOUT_BINO: {
            _weaponsInfo = _x;

            // Check weapon & weapon attachments
            {
                // Skip magazines
                if (_forEachIndex in [4, 5]) then {
                    continue;
                };

                if (_x != "") then {
                    _weaponsInfo set [_forEachIndex, _x call FUNC(baseWeapon)];
                };
            } forEach _weaponsInfo;
        };
        // Uniform, vest, backpack
        case IDX_LOADOUT_UNIFORM;
        case IDX_LOADOUT_VEST;
        case IDX_LOADOUT_BACKPACK: {
            _x params ["", ["_items", []]];

            // Check if container has items that need replacing with a defined base
            {
                switch (true) do {
                    // Containers have 2 entries: Name and isBackpack
                    case (_x isEqualTypeArray ["", false]);
                    // Misc. items have 2 entries: Name and amount
                    case (_x isEqualTypeArray ["", 0]): {
                        _x params ["_item", "_arg"];

                        if (_item != "") then {
                            _uniqueBaseCfgText = (getText ([_cfgWeapons, _cfgVehicles] select ((_arg isEqualType false) && {_arg}) >> _item >> QGVAR(uniqueBase))) call EFUNC(common,getConfigName);

                            if (_uniqueBaseCfgText != "") then {
                                _x set [0, _uniqueBaseCfgText];
                            };
                        };
                    };
                    // Weapons have 2 entries: Weapon info array and amount
                    case (_x isEqualTypeArray [[], 0]): {
                        _weapon = (_x select 0) select 0;

                        if (_weapon != "") then {
                            (_x select 0) set [0, _weapon call FUNC(baseWeapon)];
                        };
                    };
                    // Magazines have 3 entries: Name, amount and ammo count
                    case (_x isEqualTypeArray ["", 0, 0]): {
                        _x params ["_item"];

                        if (_item != "") then {
                            _uniqueBaseCfgText = (getText (_cfgMagazines >> _item >> QGVAR(uniqueBase))) call EFUNC(common,getConfigName);

                            if (_uniqueBaseCfgText != "") then {
                                _x set [0, _uniqueBaseCfgText];
                            };
                        };
                    };
                };
            } forEach _items;
        };
        // Assigned items: Map, Compass, Watch, GPS / UAV Terminal, Radio, NVGs
        case IDX_LOADOUT_ASSIGNEDITEMS: {
            // Check if assignedItems have items that need replacing with a defined base
            _items = _x;

            {
                if (_x != "") then {
                    _uniqueBaseCfgText = (getText (_cfgWeapons >> _x >> QGVAR(uniqueBase))) call EFUNC(common,getConfigName);

                    if (_uniqueBaseCfgText != "") then {
                        _items set [_forEachIndex, _uniqueBaseCfgText];
                    };
                };
            } forEach _items;
        };
    };
} forEach _loadout;

_loadout
