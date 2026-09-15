#include "..\script_component.hpp"
/*
 * Author: Pterolatypus
 * Calculates total weapon inertia, accounting for attachments.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Total inertia <NUMBER>
 *
 * Example:
 * [ACE_player] call ace_advanced_fatigue_fnc_getWeaponInertia
 *
 * Public: No
 */
params ["_unit"];

private _weapon = currentWeapon _unit;
private _weaponAndItems = [_weapon] + (_unit weaponAccessories _weapon);

GVAR(inertiaCache) getOrDefaultCall [_weaponAndItems, {
    private _inertia = 0;
    private _cfgWeapons = configFile >> "CfgWeapons";

    {
        _inertia = _inertia + getNumber (_cfgWeapons >> _x >> "inertia");
    } forEach _weaponAndItems;

    _inertia
}, true] // return
