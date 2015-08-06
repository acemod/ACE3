/*
 * Author: Garth 'L-H' de Wet
 * Adds an item,weapon,magazine to the unit's inventory
 * or places it in a weaponHolder if no space.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Classname <STRING>
 * 2: Container (uniform, vest, backpack) <STRING><OPTIONAL>
 * 3: Magazine Ammo Count <NUMBER><OPTIONAL>
 *
 * Return Value:
 * Array:
 * 0: Added to player (Bool)
 * 1: weaponholder (OBJECT)
 *
 * Public: No
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_unit", "_classname", ["_container", ""], ["_ammoCount", -1]];

private ["_addedToPlayer", "_canAdd", "_type", "_pos"];

_canAdd = false;
_addedToPlayer = true;

_type = [_classname] call FUNC(getItemType);

_canAdd = switch (_container) do {
    case "vest": { _unit canAddItemToVest _classname };
    case "backpack": { _unit canAddItemToBackpack _classname };
    case "uniform": { _unit canAddItemToUniform _classname };
    default { _unit canAdd _classname };
};

switch ((_type select 0)) do {
    case "weapon": {
        if (_canAdd) then {
            switch (_container) do {
                case "vest": {  (vestContainer _unit) addWeaponCargoGlobal [_classname, 1]; };
                case "backpack": {  (backpackContainer _unit) addWeaponCargoGlobal [_classname, 1]; };
                case "uniform": {  (uniformContainer _unit) addWeaponCargoGlobal [_classname, 1]; };
                default { _unit addWeaponGlobal _classname; };
            };
        } else {
            _addedToPlayer = false;
            _pos = _unit modelToWorldVisual [0,1,0.05];
            _unit = createVehicle ["WeaponHolder_Single_F",_pos,[],0,"NONE"];
            _unit addWeaponCargoGlobal [_classname,1];
            _unit setPosATL _pos;
        };
    };
    case "magazine": {
        if (_ammoCount == -1) then {_ammoCount = getNumber (configFile >> "CfgMagazines" >> _classname >> "count");};
        if (_canAdd) then {
            switch (_container) do {
                case "vest": {  (vestContainer _unit) addMagazineCargoGlobal [_classname, _ammoCount]; };
                case "backpack": {  (backpackContainer _unit) addMagazineCargoGlobal [_classname, _ammoCount]; };
                case "uniform": {  (uniformContainer _unit) addMagazineCargoGlobal [_classname, _ammoCount]; };
                default {_unit addMagazine [_classname, _ammoCount]; };
            };
        } else {
            _addedToPlayer = false;
            _pos = _unit modelToWorldVisual [0,1,0.05];
            _unit = createVehicle ["WeaponHolder_Single_F",_pos,[],0,"NONE"];
            _unit addMagazineCargoGlobal [_classname, _ammoCount];
            _unit setPosATL _pos;
        };
    };
    case "item": {
        if (_canAdd) then {
            switch (_container) do {
                case "vest": { _unit addItemToVest _classname; };
                case "backpack": { _unit addItemToBackpack _classname; };
                case "uniform": { _unit addItemToUniform _classname; };
                default { _unit addItem _classname; };
            };
        } else {
            _addedToPlayer = false;
            _pos = _unit modelToWorldVisual [0,1,0.05];
            _unit = createVehicle ["WeaponHolder_Single_F",_pos,[],0,"NONE"];
            _unit addItemCargoGlobal [_classname,1];
            _unit setPosATL _pos;
        };
    };
    default {diag_log format ["ACE: Incorrect item type passed to %1, passed: %2",QFUNC(AddToInventory),_type];};
};

[_addedToPlayer,_unit] // Return
