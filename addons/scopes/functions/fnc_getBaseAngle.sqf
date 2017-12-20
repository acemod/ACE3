/*
 * Author: Ruthberg
 * Gets the base angle of the weapon & optic combination with the given weapon index
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

params ["_unit", "_weaponIndex"];

if (_weaponIndex < 0 || {_weaponIndex > 2}) exitWith { 0 }; 

private _weaponClass = [primaryWeapon _unit, secondaryWeapon _unit, handgunWeapon _unit] select _weaponIndex; 
private _opticsClass = ([_unit] call FUNC(getOptics)) select _weaponIndex; 

private _weaponConfig = configFile >> "CfgWeapons" >> _weaponClass;
private _baseAngle = getNumber(_weaponConfig >> "ACE_IronSightBaseAngle");

if (_opticsClass != "") then {
    if (isNumber (_weaponConfig >> "ACE_RailBaseAngle")) then {
        _baseAngle = getNumber(_weaponConfig >> "ACE_RailBaseAngle");
    } else {
        _baseAngle = DEFAULT_RAIL_BASE_ANGLE;
    };
};

_baseAngle
