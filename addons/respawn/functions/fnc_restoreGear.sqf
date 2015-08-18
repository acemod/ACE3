/*
  Name: ACE_Respawn_fnc_restoreGear

  Author(s):
    bux578

  Description:
    Restores previously saved gear

  Parameters:
    0: OBJECT - unit
    1: ARRAY<String, Array, ...> - Array containing all gear (result of ACE_common_fnc_getAllGear)

  Returns:
    VOID
*/

#include "script_component.hpp"

PARAMS_2(_unit,_allGear);

private ["_unit", "_allGear", "_headgear", "_goggles",
"_uniform", "_uniformitems",
"_vest", "_vestitems",
"_backpack", "_backpackitems", "_backpa",
"_primaryweapon", "_primaryweaponitems", "_primaryweaponmagazine",
"_secondaryweapon", "_secondaryweaponitems", "_secondaryweaponmagazine",
"_handgunweapon", "_handgunweaponitems", "_handgunweaponmagazine",
"_assigneditems", "_binocular",
"_activeWeaponAndMuzzle", "_activeWeapon", "_activeMuzzle", "_activeWeaponMode"];


// remove all starting gear of a player
removeAllWeapons _unit;
removeGoggles _unit;
removeHeadgear _unit;
removeVest _unit;
removeUniform _unit;
removeAllAssignedItems _unit;
clearAllItemsFromBackpack _unit;
removeBackpack _unit;

_headgear = _allGear select 0;
_goggles = _allGear select 1;
_uniform = _allGear select 2;
_uniformitems = _allGear select 3;
_vest = _allGear select 4;
_vestitems = _allGear select 5;
_backpack = _allGear select 6;
_backpackitems = _allGear select 7;
_primaryweapon = _allGear select 8;
_primaryweaponitems = _allGear select 9;
_primaryweaponmagazine = _allGear select 10;
_secondaryweapon = _allGear select 11;
_secondaryweaponitems = _allGear select 12;
_secondaryweaponmagazine = _allGear select 13;
_handgunweapon = _allGear select 14;
_handgunweaponitems = _allGear select 15;
_handgunweaponmagazine = _allGear select 16;
_assigneditems = _allGear select 17;
_binocular = _allGear select 18;
_activeWeaponAndMuzzle = _allGear select 19;


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
} forEach _uniformitems;

{
    _unit addItemToVest _x;
} forEach _vestitems;

private "_flagRemoveDummyBag";
_flagRemoveDummyBag = false;

if (format["%1", _backpack] != "") then {
    _unit addBackpack _backpack;

    _backpa = unitBackpack _unit;
    clearMagazineCargoGlobal _backpa;
    clearWeaponCargoGlobal _backpa;
    clearItemCargoGlobal _backpa;
    {
        _unit addItemToBackpack _x;
    } forEach _backpackitems;

} else {
    // dummy backpack to ensure mags being loaded
    _unit addBackpack "B_Kitbag_Base";

    _flagRemoveDummyBag = true;
};


// primaryWeapon
if ((_primaryweapon != "") && {_primaryweapon != "ACE_FakePrimaryWeapon"}) then {
    {
        _unit addMagazine _x;
    } forEach _primaryweaponmagazine;

    _unit addWeapon _primaryweapon;

    {
        if (_x != "") then {
            _unit addPrimaryWeaponItem _x;
        };
    } forEach _primaryweaponitems;
};


// secondaryWeapon
if (_secondaryweapon != "") then {
    {
        _unit addMagazine _x;
    } forEach _secondaryweaponmagazine;

    _unit addWeapon _secondaryweapon;

    {
        if (_x != "") then {
            _unit addSecondaryWeaponItem _x;
        };
    } forEach _secondaryweaponitems;
};


// handgun
if (_handgunweapon != "") then {
    {
        _unit addMagazine _x;
    } forEach _handgunweaponmagazine;

    _unit addWeapon _handgunweapon;

    {
        if (_x != "") then {
            _unit addHandgunItem _x;
        };
    } forEach _handgunweaponitems;
};


// remove dummy bagpack
if (_flagRemoveDummyBag) then {
    removeBackpack _unit;
};


_assignedItems = _assignedItems - [_binocular];

// items
{_unit linkItem _x} forEach _assignedItems;

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
_activeWeapon = _activeWeaponAndMuzzle select 0;
_activeMuzzle = _activeWeaponAndMuzzle select 1;
_activeWeaponMode = _activeWeaponAndMuzzle select 2;

if (_activeMuzzle != "" and _activeMuzzle != _activeWeapon) then {
    _unit selectWeapon _activeMuzzle;
} else {
    if (_activeWeapon != "") then {
        _unit selectWeapon _activeWeapon;
    };
};

if (currentWeapon _unit != "") then {
    private ["_index"];
    _index = 0;
    while {
        _index < 100 && {currentWeaponMode _unit != _activeWeaponMode}
    } do {
        _unit action ["SwitchWeapon", _unit, _unit, _index];
        _index = _index + 1;
    };
};
