#include "script_component.hpp"
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

params ["_mortar"];

if (_mortar getVariable [QGVAR(initialized),false] || _mortar getVariable [QGVAR(exclude),false]) exitWith {TRACE_1("Exit",_mortar)};
if (!(_mortar turretLocal [0])) exitWith {TRACE_1("Exit - turret not local",_mortar)};

// Remove all magazines from turret
if (count magazines _mortar > 0) then {
    {
        _mortar removeMagazineTurret [_x,[0]];
    } forEach magazines _mortar;
};

// Replace current turret weapon with ammo handling weapon
private _currentWeapon = _mortar weaponsTurret [0] select 0;
private _newWeapon = "";

if (_currentWeapon == "mortar_82mm") then {
    _newWeapon = "ace_mortar_82mm";
} else {
    _newWeapon = getText (configFile >> "CfgWeapons" >> _currentWeapon >> QGVAR(replaceWith));
};

if (_newWeapon != "") then {
    _mortar removeWeaponTurret [_currentWeapon,[0]];
    _mortar addWeaponTurret [_newWeapon,[0]];
};

_mortar setVariable [QGVAR(initialized),true,true];
TRACE_1("Init complete",_mortar);
