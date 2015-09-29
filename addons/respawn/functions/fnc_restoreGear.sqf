/*
 * Author: bux578
 * Restores previously saved gear.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: All Gear based on return value of ACE_common_fnc_getAllGear <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_Player, stored_allGear] call ace_respawn_fnc_restoreGear
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_allGear"];

// remove all starting gear of a player
removeAllWeapons _unit;
removeGoggles _unit;
removeHeadgear _unit;
removeVest _unit;
removeUniform _unit;
removeAllAssignedItems _unit;
clearAllItemsFromBackpack _unit;
removeBackpack _unit;

_allGear params [
    "_headgear", "_goggles",
    "_uniform", "_uniformitems",
    "_vest", "_vestitems",
    "_backpack", "_backpackitems",
    "_primaryweapon", "_primaryweaponitems", "_primaryweaponmagazine",
    "_secondaryweapon", "_secondaryweaponitems", "_secondaryweaponmagazine",
    "_handgunweapon", "_handgunweaponitems", "_handgunweaponmagazine",
    "_assigneditems", "_binocular",
    "_activeWeaponAndMuzzle"
];

// start restoring the items
if (_headgear != "") then {_unit addHeadgear _headgear};
if (_goggles != "") then {_unit addGoggles _goggles};
if (_uniform != "") then {_unit forceAddUniform _uniform};
if (_vest != "") then {_unit addVest _vest};

{
    _unit addItemToUniform _x;
    false
} count _uniformitems;

{
    _unit addItemToVest _x;
    false
} count _vestitems;

private "_flagRemoveDummyBag";

if (format ["%1", _backpack] != "") then {
    _unit addBackpack _backpack;

    // make sure the backpack is empty. Some bags are prefilled by config
    private "_backpackObject";
    _backpackObject = unitBackpack _unit;

    clearMagazineCargoGlobal _backpackObject;
    clearWeaponCargoGlobal _backpackObject;
    clearItemCargoGlobal _backpackObject;

    {
        _unit addItemToBackpack _x;
        false
    } count _backpackitems;

    _flagRemoveDummyBag = false;
} else {
    // dummy backpack to ensure mags being loaded
    _unit addBackpack "Bag_Base";

    _flagRemoveDummyBag = true;
};

// primaryWeapon
if ((_primaryweapon != "") && {_primaryweapon != "ACE_FakePrimaryWeapon"}) then {
    {
        _unit addMagazine _x;
        false
    } count _primaryweaponmagazine;

    _unit addWeapon _primaryweapon;

    {
        if (_x != "") then {
            _unit addPrimaryWeaponItem _x;
        };
        false
    } count _primaryweaponitems;
};

// secondaryWeapon
if (_secondaryweapon != "") then {
    {
        _unit addMagazine _x;
        false
    } count _secondaryweaponmagazine;

    _unit addWeapon _secondaryweapon;

    {
        if (_x != "") then {
            _unit addSecondaryWeaponItem _x;
        };
        false
    } count _secondaryweaponitems;
};

// handgun
if (_handgunweapon != "") then {
    {
        _unit addMagazine _x;
        false
    } count _handgunweaponmagazine;

    _unit addWeapon _handgunweapon;

    {
        if (_x != "") then {
            _unit addHandgunItem _x;
        };
        false
    } count _handgunweaponitems;
};

// remove dummy bagpack
if (_flagRemoveDummyBag) then {
    removeBackpack _unit;
};

_assignedItems deleteAt (_assignedItems find _binocular);

// items
{_unit linkItem _x; false} count _assignedItems;

_unit addWeapon _binocular;

// reload Laserdesignator
// we assume that if the unit had a Laserdesignator it probably had batteries for it
if ("Laserdesignator" in assignedItems _unit) then {
    _unit selectWeapon "Laserdesignator";

    if (currentMagazine _unit == "") then {
        _unit addMagazine "Laserbatteries";
    };
};

// restore the last active weapon, muzzle and weaponMode
_activeWeaponAndMuzzle params ["_activeWeapon", "_activeMuzzle", "_activeWeaponMode"];

if (
    (_activeMuzzle != "") &&
    {_activeMuzzle != _activeWeapon} &&
    {_activeMuzzle in getArray (configfile >> "CfgWeapons" >> _activeWeapon >> "muzzles")}
) then {
    _unit selectWeapon _activeMuzzle;
} else {
    if (_activeWeapon != "") then {
        _unit selectWeapon _activeWeapon;
    };
};

if (currentWeapon _unit != "") then {
    private "_index";
    _index = 0;

    while {
        _index < 100 && {currentWeaponMode _unit != _activeWeaponMode}
    } do {
        _unit action ["SwitchWeapon", _unit, _unit, _index];
        _index = _index + 1;
    };
};
