/*
 * Author: bux578, commy2
 * Applies gear to unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: All Gear based on return value of ACE_common_fnc_getAllGear <ARRAY>
 * 2: Remove all attachments from weapons? (default: false) <BOOL>
 * 3: Remove all items from prefilled backpacks? (default: false) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, gear_array, true, true] call ace_common_fnc_setAllGear
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit", "_allGear", ["_clearAttachments", false], ["_clearBackpack", false]];

// remove all starting gear of a player
removeAllWeapons _unit;
removeGoggles _unit;
removeHeadgear _unit;
removeVest _unit;
removeUniform _unit;
removeAllAssignedItems _unit;
removeBackpack _unit;

_allGear params [
    "_headgear", "_goggles",
    "_uniform", "_uniformitems",
    "_vest", "_vestitems",
    "_backpack", "_backpackitems",
    "_primaryweapon", "_primaryweaponitems", "_primaryweaponmagazine",
    "_secondaryweapon", "_secondaryweaponitems", "_secondaryweaponmagazine",
    "_handgunweapon", "_handgunweaponitems", "_handgunweaponmagazine",
    "_assigneditems",
    "_binocular",
    "_binocularmagazine"
];

// start restoring the items
if (_headgear != "") then {_unit addHeadgear _headgear};
if (_goggles != "") then {_unit addGoggles _goggles};

// ensure all weapons being loaded
_unit addBackpack "ACE_FakeBackpack";

// primaryWeapon
if (_primaryweapon != "") then {
    {
        _unit addMagazine _x;
        false
    } count _primaryweaponmagazine;

    _unit addWeapon _primaryweapon;

    if (_clearAttachments) then {
        removeAllPrimaryWeaponItems _unit;
    };

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

    if (_clearAttachments) then {
        //removeAllSecondaryWeaponItems _unit;
        {
            _unit removeSecondaryWeaponItem _x;
            false
        } count secondaryWeaponItems _unit;
    };

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

    if (_clearAttachments) then {
        removeAllHandgunItems _unit;
    };

    {
        if (_x != "") then {
            _unit addHandgunItem _x;
        };
        false
    } count _handgunweaponitems;
};

// binocular
_unit addWeapon _binocular;
_unit addMagazine _binocularmagazine;

// done with dummy backpack. now remove
removeBackpack _unit;

// uniform
if (_uniform != "") then {
    _unit forceAddUniform _uniform;
};

{
    _unit addItemToUniform _x;
    false
} count _uniformitems;

// vest
if (_vest != "") then {
    _unit addVest _vest;
};

{
    _unit addItemToVest _x;
    false
} count _vestitems;

// backpack
if (_backpack != "") then {
    _unit addBackpack _backpack;

    if (_clearBackpack) then {
        private _backpackObject = unitBackpack _unit;

        clearMagazineCargoGlobal _backpackObject;
        clearWeaponCargoGlobal _backpackObject;
        clearItemCargoGlobal _backpackObject;
    };

    {
        _unit addItemToBackpack _x;
        false
    } count _backpackitems;
};

// assigned items
_assignedItems deleteAt (_assignedItems find _binocular);

{
    _unit linkItem _x;
    false
} count _assignedItems;

nil
