/*
 * Author: AACO
 * Takes a getUnitLoadout (https://community.bistudio.com/wiki/Talk:getUnitLoadout)
 * weapon array and adds it, the loaded magazine and the attachements to a given container.
 *
 * Arguments:
 * 0: The getUnitLoadout weapon array <ARRAY>
 * 1: The container to add the weapon to <OBJECT>
 * 2: Number of weapons to add. <NUMBER> (default: 1)
 *    Note: in general A3 does not handle this amazingly for semi unique weapons.
 *          for weapons with the same class name but different ammo counts or attachements
 *          only the 'top' weapon's configuration is returned to the weapon array
 *
 * Return Value:
 * None
 *
 * Example:
 * [["arifle_MX_GL_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Aco", ["30Rnd_65x39_caseless_mag", 30], ["1Rnd_HE_Grenade_shell", 1], ""], "ACE_bodyBackHolderObject" createVehicle (getPos player)] call ACE_medical_fnc_addWeaponArrayToContainer
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    "_weaponArray",
    "_container",
    ["_weaponCount", 1, [0]] //
];
TRACE_3("params", _weaponArray, _container, _weaponCount);

if !(_weaponArray isEqualTo []) then {
    _weaponArray params [
        "_weapon",
        "_muzzle",
        "_pointer",
        "_optic",
        "_primaryMuzMag",
        "_secondaryMuzMag",
        "_bipod"
    ];

    // look up attachementless weapon
    private _weaponCfg = (configfile >> "cfgweapons" >> _weapon);
    if !(isClass _weaponCfg) exitWith {}; // if weapon is not valid exit here (shouldn't happen but B&S)

    private _baseWeapon = getText (_weaponCfg >> "baseWeapon");
    if (_baseWeapon == "") then { // no base weapon reference on weapon class, just use provided classname (trying to lookup parents can end poorly)
        _container addWeaponCargoGlobal [_weapon, _weaponCount];
    } else { // base weapon reference on weapon class, use it
        _container addWeaponCargoGlobal [_baseWeapon, _weaponCount];
    };

    // add weapon items
    {
        if (_x != "") then { _container addItemCargoGlobal [_x, _weaponCount]; };
    } forEach [_muzzle, _pointer, _optic, _bipod];

    // add weapon magazines
    {
        if !(_x isEqualTo []) then {
            _x params ["_mag", "_count"];
            _container addMagazineAmmoCargo [_mag, _weaponCount, _count];
        };
    } forEach [_primaryMuzMag, _secondaryMuzMag];
};
