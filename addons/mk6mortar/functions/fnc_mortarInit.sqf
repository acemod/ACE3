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
#include "script_component.hpp"

params ["_mortar"];
private ["_newWeapon","_currentWeapon"];

if (_mortar getVariable [QGVAR(initialized),false] || _mortar getVariable [QGVAR(exclude),false]) exitWith {};

// Remove all magazines
if (count magazines _mortar > 0) then {
    {_mortar removeMagazineGlobal _x} forEach magazines _mortar;
};

// Replace current weapon with ammo handling weapon
_currentWeapon = _mortar weaponsTurret [0] select 0;

if (_currentWeapon == "mortar_82mm") then {
    _newWeapon = "ace_mortar_82mm"
} else {
    _newWeapon = getText (configFile >> "CfgWeapons" >> _currentWeapon >> QGVAR(replaceWith));
};

if (_newWeapon != "") then {
    _mortar removeWeaponGlobal _currentWeapon;
    _mortar addWeaponGlobal _newWeapon;
};

_mortar setVariable [QGVAR(initialized),true,true];
TRACE_1("Init complete",_mortar);
