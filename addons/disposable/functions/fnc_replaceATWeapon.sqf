/*
 * Author: bux, commy2
 * Replace the disposable launcher with the used dummy.
 *
 * Arguments:
 * 0: unit - Object the event handler is assigned to <OBJECT>
 * 1: weapon - Fired weapon <STRING>
 * 2: muzzle - Muzzle that was used <STRING>
 * 3: mode - Current mode of the fired weapon <STRING>
 * 4: ammo - Ammo used <STRING>
 * 5: magazine - magazine name which was used <STRING>
 * 6: projectile - Object of the projectile that was shot <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [fromBisFiredEH] call ace_disposable_fnc_replaceATWeapon;
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_unit", "_tube", "_projectile"];

_unit = _this select 0;
if (!local _unit) exitWith {};

_tube = getText (configFile >> "CfgWeapons" >> (_this select 1) >> "ACE_UsedTube");
if (_tube == "") exitWith {};

_projectile = _this select 6;

private "_items";

_items = secondaryWeaponItems _unit;

_unit addWeapon _tube;
_unit selectWeapon _tube;
{
    if (_x != "") then {_unit addSecondaryWeaponItem _x};
} forEach _items;

// AI
if !([_unit] call EFUNC(common,isPlayer)) then {
    //waits until _projectile is null, so random 0-2 tickTime seconds after that
    [FUNC(aiDropWeaponCallback), 2, [_unit, _tube, _projectile]] call CBA_fnc_addPerFrameHandler;
};
