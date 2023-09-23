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
params [["_unit", ACE_player, [objNull]]];

private _cache = GVAR(inertiaCache);
private _weapon = currentWeapon _unit;
private _weaponAndItems = [_weapon] + (_unit weaponAccessories _weapon);

private _inertia = _cache get _weaponAndItems;
if (isNil "_inertia") then {
    _inertia = 0;
    private _cfgWeapons = configFile >> "CfgWeapons";
    {
        // if item is "" or inertia property is undefined, just ignore it
        private _itemInertia = getNumber (_cfgWeapons >> _x >> "inertia");
        if (isNil "_itemInertia") then { continue };

        _inertia = _inertia + _itemInertia;
    } forEach _weaponAndItems;
    _cache set [_weaponAndItems, _inertia];
};

GVAR(inertia) = _inertia;
_inertia
