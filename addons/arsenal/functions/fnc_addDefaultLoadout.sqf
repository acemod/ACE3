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

for "_dataIndex" from 0 to 10 do {
    switch (_dataIndex) do {

        case 0;
        case 1;
        case 2;
        case 8: {
            if (count (_loadout select _dataIndex) > 0) then {

                private _weapon = (_loadout select _dataIndex) select 0;
                if (_weapon != "") then {

                    private _baseWeapon = _weapon call BIS_fnc_baseWeapon;
                     if (_weapon != _baseWeapon) then {
                        (_loadout select _dataIndex) set [0, _baseWeapon];
                    };
                };
            };
        };

        case 3;
        case 4;
        case 5: {
            if (count (_loadout select _dataIndex) > 0) then {
                private _containerContents = (_loadout select _dataIndex) select 1;

                if (count _containerContents > 0) then {

                    {
                        if (count _x == 2) then {

                                if ((_x select 0) isEqualType "") then {

                                    private _item = (_x select 0);
                                    if (_item != "") then {

                                        private _uniqueBaseCfgText = getText (configFile >> "CfgWeapons" >> _item >> "ace_arsenal_uniqueBase");
                                        if (_uniqueBaseCfgText != "") then {

                                            _x set [0, _uniqueBaseCfgText];
                                        };
                                    };
                                } else {
                                    private _weapon = (_x select 0) select 0;
                                    if (_weapon != "") then {

                                        private _baseWeapon = _weapon call BIS_fnc_baseWeapon;
                                        if (_weapon != _baseWeapon) then {
                                            (_x select 0)set [0, _baseWeapon];
                                        };
                                    };
                                };
                            };
                    } foreach _containerContents;
                };
            };
        };

        case 9: {
            for "_subIndex" from 0 to 4 do {
                private _item = (_loadout select _dataIndex) select _subIndex;

                if (_item != "") then {

                    private _uniqueBaseCfgText = getText (configFile >> "CfgWeapons" >> _item >> "ace_arsenal_uniqueBase");
                    if (_uniqueBaseCfgText != "") then {

                        (_loadout select _dataIndex) set [_subIndex, _uniqueBaseCfgText];
                    };
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
