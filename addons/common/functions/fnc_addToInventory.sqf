#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Adds an item, weapon, or magazine to the unit's inventory or places it in a weapon holder if no space.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Classname <STRING>
 * 2: Container (uniform, vest, backpack) (default: "") <STRING>
 * 3: Magazine Ammo Count (default: -1) <NUMBER>
 *
 * Return Value:
 * 0: Added to player <BOOL>
 * 1: Weapon holder item was placed in <OBJECT>
 *
 * Example:
 * [player, "30Rnd_65x39_caseless_mag", "", 5] call ace_common_fnc_addToInventory
 *
 * Public: Yes
 */

params ["_unit", "_classname", ["_container", ""], ["_ammoCount", -1]];

private _type = _classname call FUNC(getItemType);

private _canAdd = false;
private _canFitWeaponSlot = false;
private _addedToUnit = false;
private _weaponHolder = _unit;

switch (_container) do {
    case "vest": {
        _canAdd = [_unit, _classname, 1, false, true, false] call CBA_fnc_canAddItem;
    };
    case "backpack": {
        _canAdd = [_unit, _classname, 1, false, false, true] call CBA_fnc_canAddItem;
    };
    case "uniform": {
        _canAdd = [_unit, _classname, 1, true, false, false] call CBA_fnc_canAddItem;
    };
    default {
        _canAdd = [_unit, _classname] call CBA_fnc_canAddItem;
        if (_canAdd) then {
            switch (_type select 1) do {
                case "primary": {
                    _canFitWeaponSlot = primaryWeapon _unit == "";
                };
                case "secondary": {
                    _canFitWeaponSlot = secondaryWeapon _unit == "";
                };
                case "handgun": {
                    _canFitWeaponSlot = handgunWeapon _unit == "";
                };
                case "binocular": {
                    _canFitWeaponSlot = binocular _unit == "";
                };
            };
        };
    };
};

if (_type select 0 == "magazine") then {
    private _configAmmoCount = getNumber (configFile >> "CfgMagazines" >> _classname >> "count");

    // https://feedback.bistudio.com/T74244
    // When adding throwables with the addXXXCargo(Global) commands, they don't show up in the throwables list
    // If a throwable has more than 1 ammo count, adding it with addItem(XXX) commands also renders the throwable unusable
    if (_configAmmoCount == 1 && {_ammoCount in [-1, 1]} && {_classname call BIS_fnc_isThrowable}) then { // TODO: replace with https://community.bistudio.com/wiki/isThrowable in 2.18
        _type set [0, "item"];
    };

    if (_ammoCount == -1) then {
        _ammoCount = _configAmmoCount;
    };
};

switch (_type select 0) do {
    case "weapon": {
        if (_canAdd || {_canFitWeaponSlot}) then {
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
                    if (_canFitWeaponSlot) then {
                        _unit addWeaponGlobal _classname;
                    } else {
                        {
                            _x params ["_parameters", "_container"];

                            if (_parameters call CBA_fnc_canAddItem) exitWith {
                                _container addWeaponCargoGlobal [_classname, 1]; // addWeaponGlobal will replace the weapon currently in a slot
                            };
                        } forEach [
                            [[_unit, _classname, 1, false, false, true], backpackContainer _unit],
                            [[_unit, _classname, 1, false, true, false], vestContainer _unit],
                            [[_unit, _classname, 1, true, false, false], uniformContainer _unit]
                        ];
                    };
                };
            };
        } else {
            _addedToUnit = false;

            _weaponHolder = nearestObject [_unit, "WeaponHolder"];

            if (isNull _weaponHolder || {_unit distance _weaponHolder > 2}) then {
                _weaponHolder = createVehicle ["GroundWeaponHolder", _unit, [], 0, "CAN_COLLIDE"];
            };

            _weaponHolder addWeaponCargoGlobal [_classname, 1];
        };
    };

    case "magazine": {
        if (_canAdd) then {
            _addedToUnit = true;

            switch (_container) do {
                case "vest": {
                    (vestContainer _unit) addMagazineAmmoCargo [_classname, 1, _ammoCount];
                };
                case "backpack": {
                    (backpackContainer _unit) addMagazineAmmoCargo [_classname, 1, _ammoCount];
                };
                case "uniform": {
                    (uniformContainer _unit) addMagazineAmmoCargo [_classname, 1, _ammoCount];
                };
                default {
                    _unit addMagazine [_classname, _ammoCount];
                };
            };
        } else {
            _addedToUnit = false;

            _weaponHolder = nearestObject [_unit, "WeaponHolder"];

            if (isNull _weaponHolder || {_unit distance _weaponHolder > 2}) then {
                _weaponHolder = createVehicle ["GroundWeaponHolder", _unit, [], 0, "CAN_COLLIDE"];
            };

            _weaponHolder addMagazineAmmoCargo [_classname, 1, _ammoCount];
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

            _weaponHolder = nearestObject [_unit, "WeaponHolder"];

            if (isNull _weaponHolder || {_unit distance _weaponHolder > 2}) then {
                _weaponHolder = createVehicle ["GroundWeaponHolder", _unit, [], 0, "CAN_COLLIDE"];
            };

            _weaponHolder addItemCargoGlobal [_classname, 1];
        };
    };

    default {
        _addedToUnit = false;
        WARNING_2("Incorrect item type passed to %1, passed: %2",QFUNC(AddToInventory),_type);
    };
};

[_addedToUnit, _weaponHolder]
