#include "script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Adds an item, weapon, or magazine to the unit's inventory or places it in a weaponHolder if no space.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Classname <STRING>
 * 2: Container (uniform, vest, backpack) (default: "") <STRING>
 * 3: Magazine Ammo Count (default: -1) <NUMBER>
 *
 * Return Value:
 * 0: Added to player <BOOL>
 * 1: weaponholder <OBJECT>
 *
 * Example:
 * [bob, "classname", "", 5] call ace_common_fnc_addToInventory
 *
 * Public: Yes
 */

params ["_unit", "_classname", ["_container", ""], ["_ammoCount", -1]];

private _type = _classname call FUNC(getItemType);

private _canAdd = false;
private _addedToUnit = false;

switch (_container) do {
    case "vest": {
        _canAdd = _unit canAddItemToVest _classname;
    };
    case "backpack": {
        _canAdd = _unit canAddItemToBackpack _classname;
    };
    case "uniform": {
        _canAdd = _unit canAddItemToUniform _classname;
    };
    default {
        _canAdd = _unit canAdd _classname;
    };
};

switch (_type select 0) do {
    case "weapon": {
        if (_canAdd) then {
            _addedToUnit = true;

            switch (_container) do {
                case "vest": {
                    (vestContainer _unit) addWeaponCargoGlobal [_classname, 1];
                };
                case "backpack": {
                    (backpackContainer _unit) addWeaponCargoGlobal [_classname, 1];
                };
                case "uniform": {
                    (uniformContainer _unit) addWeaponCargoGlobal [_classname, 1];
                };
                default {
                    _unit addWeaponGlobal _classname;
                };
            };
        } else {
            _addedToUnit = false;

            private _pos = _unit modelToWorldVisual [0,1,0.05];

            _unit = createVehicle ["WeaponHolder_Single_F", _pos, [], 0, "NONE"];
            _unit addWeaponCargoGlobal [_classname, 1];
            _unit setPosATL _pos;
        };
    };

    case "magazine": {
        if (_ammoCount == -1) then {
            _ammoCount = getNumber (configFile >> "CfgMagazines" >> _classname >> "count");
        };

        if (_canAdd) then {
            _addedToUnit = true;

            switch (_container) do {
                case "vest": {
                    (vestContainer _unit) addMagazineCargoGlobal [_classname, 1/*_ammoCount*/]; //@todo Bug! This isn't really the ammo, but magazine count. No such command.
                };
                case "backpack": {
                    (backpackContainer _unit) addMagazineCargoGlobal [_classname, 1/*_ammoCount*/]; //@todo Bug! This isn't really the ammo, but magazine count. No such command.
                };
                case "uniform": {
                    (uniformContainer _unit) addMagazineCargoGlobal [_classname, 1/*_ammoCount*/]; //@todo Bug! This isn't really the ammo, but magazine count. No such command.
                };
                default {
                    _unit addMagazine [_classname, _ammoCount];
                };
            };
        } else {
            _addedToUnit = false;

            private _pos = _unit modelToWorldVisual [0,1,0.05];

            _unit = createVehicle ["WeaponHolder_Single_F", _pos, [], 0, "NONE"];
            _unit addMagazineCargoGlobal [_classname, 1/*_ammoCount*/]; //@todo Bug! This isn't really the ammo, but magazine count. No such command.
            _unit setPosATL _pos;
        };
    };

    case "item": {
        if (_canAdd) then {
            _addedToUnit = true;

            switch (_container) do {
                case "vest": {
                    _unit addItemToVest _classname;
                };
                case "backpack": {
                    _unit addItemToBackpack _classname;
                };
                case "uniform": {
                    _unit addItemToUniform _classname;
                };
                default {
                    _unit addItem _classname;
                };
            };
        } else {
            _addedToUnit = false;

            private _pos = _unit modelToWorldVisual [0,1,0.05];

            _unit = createVehicle ["WeaponHolder_Single_F", _pos, [], 0, "NONE"];
            _unit addItemCargoGlobal [_classname, 1];
            _unit setPosATL _pos;
        };
    };

    default {
        _addedToUnit = false;
        WARNING_2("Incorrect item type passed to %1, passed: %2",QFUNC(AddToInventory),_type);
    };
};

[_addedToUnit, _unit]
