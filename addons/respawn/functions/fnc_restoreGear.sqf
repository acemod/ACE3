/*
 * Author: bux578, commy2
 * Restores previously saved gear.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: All Gear based on return value of getUnitLoadout <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_Player, stored_allGear, active_weapon_muzzle_and_mode] call ace_respawn_fnc_restoreGear
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_allGear", "_activeWeaponAndMuzzle"];

// restore all gear
if (!isNil "_allGear") then {
    {
        private _container = _allGear select _x;
        if (!(_container isEqualTo [])) then {
            _container params ["","_itemsArray"];
            {
                _x params ["_itemClassname"];

                // Handle Unique ACRE radios
                if ((getNumber (configFile >> "CfgWeapons" >> _itemClassname >> "acre_isUnique")) > 0) then {
                    private _newBase = getText (configFile >> "CfgWeapons" >> _itemClassname >> "acre_baseClass");
                    ACE_LOGINFO_2("replacing ACRE radio [%1] with base [%2]",_itemClassname,_newBase);
                    _x set [0, _newBase];
                };

                // Handle Unique TFAR radios
                if ((getNumber (configFile >> "CfgWeapons" >> _itemClassname >> "tf_radio")) > 0) then {
                    private _newBase = getText (configFile >> "CfgWeapons" >> _itemClassname >> "tf_parent");
                    ACE_LOGINFO_2("replacing TFAR radio [%1] with base [%2]",_itemClassname,_newBase);
                    _x set [0, _newBase];
                };
            } forEach _itemsArray;
        };
    } forEach [3,4,5]; // Uniform, Vest, Backpack

    _unit setUnitLoadout _allGear;
};

// restore the last active weapon, muzzle and weaponMode
if (!isNil "_activeWeaponAndMuzzle") then {
    // @todo, replace this with CBA_fnc_selectWeapon after next CBA update
    _activeWeaponAndMuzzle params ["_activeWeapon", "_activeMuzzle", "_activeWeaponMode"];

    if (
        (_activeMuzzle != "") &&
        {_activeMuzzle != _activeWeapon} &&
        {_activeMuzzle in getArray (configFile >> "CfgWeapons" >> _activeWeapon >> "muzzles")}
    ) then {
        _unit selectWeapon _activeMuzzle;
    } else {
        if (_activeWeapon != "") then {
            _unit selectWeapon _activeWeapon;
        };
    };

    if (currentWeapon _unit != "") then {
        private _index = 0;

        while {
            _index < 299 && {currentWeaponMode _unit != _activeWeaponMode}
        } do {
            _unit action ["SwitchWeapon", _unit, _unit, _index];
            _index = _index + 1;
        };
    };
};
