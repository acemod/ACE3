/*
 * Author: bux578
 * Restores previously saved gear.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: All Gear <ARRAY>
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

private ["_flagRemoveDummyBag", "_backpa"];

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
    "_headgear", "_goggles", "_uniform", "_uniformitems", "_vest",
    "_vestitems", "_backpack", "_backpackitems", "_primaryweapon",
    "_primaryweaponitems", "_primaryweaponmagazine", "_secondaryweapon",
    "_secondaryweaponitems", "_secondaryweaponmagazine", "_handgunweapon",
    "_handgunweaponitems", "_handgunweaponmagazine", "_assigneditems", "_binocular"
];

// start restoring the items
if (_headgear != "") then {
    _unit addHeadgear _headgear;
};
if (_uniform != "") then {
    _unit forceAddUniform _uniform;
};
if (_vest != "") then {
    _unit addVest _vest;
};
if (_goggles != "") then {
    _unit addGoggles _goggles;
};

{
    _unit addItemToUniform _x;
} count _uniformitems;

{
    _unit addItemToVest _x;
} count _vestitems;

_flagRemoveDummyBag = false;

if (format ["%1", _backpack] != "") then {
    _unit addBackpack _backpack;

    _backpa = unitBackpack _unit;
    clearMagazineCargoGlobal _backpa;
    clearWeaponCargoGlobal _backpa;
    clearItemCargoGlobal _backpa;
    {
        _unit addItemToBackpack _x;
    } count _backpackitems;
} else {
    // dummy backpack to ensure mags being loaded
    _unit addBackpack "B_Kitbag_Base";

    _flagRemoveDummyBag = true;
};

// primaryWeapon
if ((_primaryweapon != "") && {_primaryweapon != "ACE_FakePrimaryWeapon"}) then {
    {
        _unit addMagazine _x;
    } count _primaryweaponmagazine;

    _unit addWeapon _primaryweapon;

    {
        if (_x != "") then {
            _unit addPrimaryWeaponItem _x;
        };
    } count _primaryweaponitems;
};

// secondaryWeapon
if (_secondaryweapon != "") then {
    {
        _unit addMagazine _x;
    } count _secondaryweaponmagazine;

    _unit addWeapon _secondaryweapon;

    {
        if (_x != "") then {
            _unit addSecondaryWeaponItem _x;
        };
    } count _secondaryweaponitems;
};

// handgun
if (_handgunweapon != "") then {
    {
        _unit addMagazine _x;
    } count _handgunweaponmagazine;

    _unit addWeapon _handgunweapon;

    {
        if (_x != "") then {
            _unit addHandgunItem _x;
        };
    } count _handgunweaponitems;
};

// remove dummy bagpack
if (_flagRemoveDummyBag) then {
    removeBackpack _unit;
};

_assignedItems = _assignedItems - [_binocular];

// items
{
    _unit linkItem _x
} count _assignedItems;

_unit addWeapon _binocular;

if ("Laserdesignator" in assignedItems _unit) then {
    _unit selectWeapon "Laserdesignator";
    if (currentMagazine _unit == "") then {
        _unit addMagazine "Laserbatteries";
    };
};
