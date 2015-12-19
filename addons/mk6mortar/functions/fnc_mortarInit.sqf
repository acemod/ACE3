/*
 * Author: VKing
 * Initializes mortar for use with ammunition handling magazines.
 *
 * Arguments:
 * 0: Mortar <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [mortar1] call ace_mk6mortar_fnc_mortarInit
 *
 * Public: No
 */
#define DEBUG_MODE_FULL
#include "script_component.hpp"

PARAMS_1(_mortar);

if (_mortar getVariable [QGVAR(initialized),false]) exitWith {};

// Remove all magazines
if (count magazines _mortar > 0) then {
    {_mortar removeMagazineGlobal _x} forEach magazines _mortar;
};

// Replace current weapon with ammo handling weapon
private _currentWeapon = _mortar weaponsTurret [0] select 0;
private _newWeapon = getText (configFile >> "CfgWeapons" >> _currentWeapon >> QGVAR(replaceWith));
if (_newWeapon != "") then {
    _mortar removeWeaponGlobal _currentWeapon;
    _mortar addWeaponGlobal _newWeapon;
};

_mortar setVariable [QGVAR(initialized),true,true];
TRACE_1("Init complete",_mortar);
