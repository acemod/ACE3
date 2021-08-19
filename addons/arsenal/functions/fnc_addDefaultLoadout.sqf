#include "script_component.hpp"
/*
 * Author: 654wak654
 * Adds a loadout to the "Default Loadouts" list.
 * If a loadout with the same name exists, it is overwritten.
 *
 * Arguments:
 * 0: Name of loadout <STRING>
 * 1: getUnitLoadout array <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Squad Leader", getUnitLoadout sql1] call ace_arsenal_fnc_addDefaultLoadout
 *
 * Public: Yes
*/

params [["_name", "", [""]], ["_loadout", [], [[]], 10]];

if (isNil QGVAR(defaultLoadoutsList)) then {
    GVAR(defaultLoadoutsList) = [];
};

private _cfgWeapons = configFile >> "CfgWeapons";
private _cfgMagazines = configFile >> "CfgMagazines";
private _cfgVehicles = configFile >> "CfgVehicles";
private _cfgGlasses = configFile >> "CfgGlasses";

for "_dataIndex" from 0 to 10 do {
    switch (_dataIndex) do {

        case 0;
        case 1;
        case 2;
        case 8: { // Primary, secondary, handgun, binocular
            if (count (_loadout select _dataIndex) > 0) then {

                for "_subIndex" from 0 to 6 do {
                    private _weapon = (_loadout select _dataIndex) select _subIndex;

                    // Magazines
                    if (_weapon isEqualType []) then {
                        private _magazine = _weapon select 0;
                        _magazine = configName (_cfgMagazines >> _magazine);
                        if (_magazine == "") then {continue}; // Skip null class
                        (_loadout select _dataIndex select _subIndex) set [0, _magazine];
                        continue
                    };
                    _weapon = configName (_cfgWeapons >> _weapon);
                    if (_weapon != "") then {
                        private _baseWeapon = _weapon call BIS_fnc_baseWeapon;
                        if (_weapon != _baseWeapon) then { _weapon = _baseWeapon };
                        (_loadout select _dataIndex) set [_subIndex, _weapon];
                    };
                };
            };
        };

        case 3;
        case 4;
        case 5: { // Uniform, Vest, Backpack
            if (count (_loadout select _dataIndex) > 0) then {
                private _containerContents = (_loadout select _dataIndex) select 1;

                if (count _containerContents > 0) then {
                    {
                        if (count _x == 2) then { //Misc Items and Weapons
                                if ((_x select 0) isEqualType "") then {

                                    private _item = (_x select 0);
                                    if (_item != "") then {
                                        switch (true) do {
                                            case (isClass (_cfgWeapons >> _item)): {_item = configName (_cfgWeapons >> _item)};
                                            case (isClass (_cfgVehicles >> _item)): {_item = configName (_cfgVehicles >> _item)};
                                            case (isClass (_cfgGlasses >> _item)): {_item = configName (_cfgGlasses >> _item)};
                                        };
                                        private _uniqueBaseCfgText = getText (configFile >> "CfgWeapons" >> _item >> "ace_arsenal_uniqueBase");
                                        if (_uniqueBaseCfgText != "") then { _item = _uniqueBaseCfgText };
                                        _x set [0, _item];
                                    };
                                } else {
                                    for "_subIndex" from 0 to 6 do {
                                        private _weapon = (_x select 0) select _subIndex;

                                        // Magazines
                                        if (_weapon isEqualType []) then {
                                            private _magazine = _weapon select 0;
                                            _magazine = configName (_cfgMagazines >> _magazine);
                                            (_x select 0 select _subIndex) set [0, _magazine];
                                            continue
                                        };

                                        if (_weapon != "") then {
                                            _weapon = configName (_cfgWeapons >> _weapon);
                                            private _baseWeapon = _weapon call BIS_fnc_baseWeapon;
                                            if (_weapon != _baseWeapon) then { _weapon = _baseWeapon };
                                            (_x select 0) set [_subIndex, _weapon];
                                        };
                                    };
                                };
                            };
                            if (count _x == 3) then { // Magazines
                                private _magazine = _x select 0;
                                _magazine = configName (_cfgMagazines >> _magazine);
                                if (_magazine == "") then {continue}; // Skip null class
                                systemChat _magazine;
                                _x set [0, _magazine];
                                systemChat str (_x);
                            };
                    } foreach _containerContents;
                };
            };
        };

        case 6: { // Headgear
            private _item = _loadout select _dataIndex;
            _item = configName (_cfgWapons >> _item);
            if (_item != "") then {
                _loadout set [_dataIndex, _item];
            };
        };
        case 7: { // Facewear
            private _item = _loadout select _dataIndex;
            _item = configName (_cfgGlasses >> _item);
            if (_item != "") then {
                _loadout set [_dataIndex, _item];
            };
        };

        case 9: { // Assigned Items
            for "_subIndex" from 0 to 4 do {
                private _item = (_loadout select _dataIndex) select _subIndex;
                _item = configName (_cfgWeapons >> _item);
                if (_item != "") then {
                    private _uniqueBaseCfgText = getText (configFile >> "CfgWeapons" >> _item >> "ace_arsenal_uniqueBase");
                    if (_uniqueBaseCfgText != "") then { _item = _uniqueBaseCfgText };
                    (_loadout select _dataIndex) set [_subIndex, _item];
                };
            };
        };
    };
};

private _loadoutIndex = (+(GVAR(defaultLoadoutsList))) findIf {(_x select 0) == _name};
if (_loadoutIndex == -1) then {
    GVAR(defaultLoadoutsList) pushBack [_name, _loadout];
} else {
    GVAR(defaultLoadoutsList) set [_loadoutIndex, [_name, _loadout]];
};
