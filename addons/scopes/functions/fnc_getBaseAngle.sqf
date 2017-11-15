/*
 * Author: Ruthberg
 * Gets the base angle of the rail on the weapon with the given weapon index
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon index <NUMBER>
 *
 * Return Value:
 * base angle <NUMBER>
 *
 * Example:
 * [player, 0] call ace_scopes_fnc_getBaseAngle
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_player", "_weaponIndex"];

if (_weaponIndex < 0 || {_weaponIndex > 2}) exitWith { 0 };

private _weaponClass = [primaryWeapon _player, secondaryWeapon _player, handgunWeapon _player] select _weaponIndex;

private _baseAngle = DEFAULT_RAIL_BASE_ANGLE;
private _weaponConfig = configFile >> "CfgWeapons" >> _weaponClass;
if (isNumber (_weaponConfig >> "ACE_RailBaseAngle")) then {
    _baseAngle = getNumber(_weaponConfig >> "ACE_RailBaseAngle");
};

_baseAngle
