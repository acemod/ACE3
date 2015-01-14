/*
 * Author: commy2
 *
 * Replace the disposable launcher with the used dummy.
 * 
 * Argument:
 * Input from "Fired" eventhandler
 * 
 * Return value:
 * Nothing
 */
 
#include "script_component.hpp"

private ["_unit", "_tube", "_projectile"];

_unit = _this select 0;
_tube = getText (configFile >> "CfgWeapons" >> (_this select 1) >> "ACE_UsedTube");
_projectile = _this select 6;

if (!local _unit) exitWith {};
if (_tube == "") exitWith {};

private "_items";

_items = secondaryWeaponItems _unit;

_unit addWeapon _tube;
_unit selectWeapon _tube;
{
  if (_x != "") then {_unit addSecondaryWeaponItem _x};
} forEach _items;

// AI
if !([_unit] call EFUNC(common,isPlayer)) then {
  //waits until _projectile is null, so random 0-2 seconds after that
  [FUNC(aiDropWeaponCallback), 2, [_unit, _tube, _projectile]] call CBA_fnc_addPerFrameHandler;
};
