/*
 * Author: Garth 'L-H' de Wet
 * Adds an item,weapon,magazine to the unit's inventory
 * or places it in a weaponHolder if no space.
 *
 * Arguments:
 * 0: Unit (OBJECT)
 * 1: Classname (String)
 * 2: Type (String)
 *
 * Return Value:
 * Array:
 * 0: Added to player (Bool)
 * 1: weaponholder (OBJECT)
 *
 * Public: Yes
 */
#include "script_component.hpp"

EXPLODE_3_PVT(_this,_unit,_classname,_type);
private "_addedToPlayer";
_addedToPlayer = true;

switch (_type) do {
    case "weapon": {
        if (!isClass(ConfigFile >> "CfgWeapons" >> _classname)) exitWith {};
        if (_unit canAdd _classname) then {
            _unit addWeaponGlobal _classname;
        } else {
            _addedToPlayer = false;
            _pos = _unit modelToWorld [0,1,0.05];
            _unit = createVehicle ["WeaponHolder_Single_F",_pos,[],0,"NONE"];
            _unit addWeaponCargoGlobal [_classname,1];
            _unit setPosATL _pos;
        };
    };
    case "magazine": {
        if (!isClass(ConfigFile >> "CfgMagazines" >> _classname)) exitWith {};
        if (_unit canAdd _classname) then {
            _unit addMagazineGlobal _classname;
        } else {
            _addedToPlayer = false;
            _pos = _unit modelToWorld [0,1,0.05];
            _unit = createVehicle ["WeaponHolder_Single_F",_pos,[],0,"NONE"];
            _unit addMagazineCargoGlobal [_classname, 1];
            _unit setPosATL _pos;
        };
    };
    case "item": {
        if (!isClass(ConfigFile >> "CfgWeapons" >> _classname)) exitWith {};
        if (_unit canAdd _classname) then {
            _unit addItem _classname;
        } else {
            _addedToPlayer = false;
            _pos = _unit modelToWorld [0,1,0.05];
            _unit = createVehicle ["WeaponHolder_Single_F",_pos,[],0,"NONE"];
            _unit addItemCargoGlobal [_classname,1];
            _unit setPosATL _pos;
        };
    };
    default {diag_log format ["ACE: Incorrect item type passed to %1, passed: %2",QFUNC(AddToInventory),_type];};
};

[_addedToPlayer,_unit]
