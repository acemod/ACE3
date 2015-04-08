/*
 * Author: Garth 'L-H' de Wet
 * Adds an item,weapon,magazine to the unit's inventory
 * or places it in a weaponHolder if no space.
 *
 * Arguments:
 * 0: Unit (OBJECT)
 * 1: Classname (String)
 * 2: Container (String, Optional) uniform, vest, backpack
 *
 * Return Value:
 * Array:
 * 0: Added to player (Bool)
 * 1: weaponholder (OBJECT)
 *
 * Public: Yes
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

EXPLODE_2_PVT(_this,_unit,_classname);
private "_addedToPlayer";
private "_container";
private "_canAdd";
private "_type";

_canAdd = false;
_addedToPlayer = true;

if((count _this) > 2) then {
    _container = _this select 2;
} else {
    _container = nil;
};

_type = [_classname] call EFUNC(common,getItemType);

if(!isNil "_container") then {
    switch (_container) do {
        case "vest": { _canAdd = _unit canAddItemToVest _classname; };
        case "backpack": { _canAdd = _unit canAddItemToBackpack _classname; };
        case "uniform": { _canAdd = _unit canAddItemToUniform _classname; };
    };
} else {
    _container = "";
    _canAdd = _unit canAdd _classname;
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
        if (_canAdd) then {
            switch (_container) do {
                case "vest": {  (vestContainer _unit) addMagazineCargoGlobal [_classname, 1]; };
                case "backpack": {  (backpackContainer _unit) addMagazineCargoGlobal [_classname, 1]; };
                case "uniform": {  (uniformContainer _unit) addMagazineCargoGlobal [_classname, 1]; };
                default { _unit addMagazineGlobal _classname; };
            };
        } else {
            _addedToPlayer = false;
            _pos = _unit modelToWorldVisual [0,1,0.05];
            _unit = createVehicle ["WeaponHolder_Single_F",_pos,[],0,"NONE"];
            _unit addMagazineCargoGlobal [_classname, 1];
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

[_addedToPlayer,_unit]
