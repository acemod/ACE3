/*
 * Author: Ledere
 * Handle preparation animation for supported launchers.
 *
 * Arguments:
 * 0: unit - Object the event handler is assigned to <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [fromWeaponEH] call ace_disposable_fnc_handlePreparation;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit","_weapon"];

//If it's an AI, if our current weapon is not a launcher, if our current launcher is not a hasPreparation launcher, or if our launcher is actually a used launcher, exit.
if (!local _unit || !([_unit] call EFUNC(common,isPlayer)) || {_weapon != secondaryWeapon _unit} || {getNumber (configFile >> "CfgWeapons" >> _weapon >> QGVAR(hasPreparation)) != 1} || {getNumber (configFile >> "CfgWeapons" >> _weapon >> "ACE_isUsedLauncher") == 1})  exitWith {};

private _config = configFile >> "CfgWeapons" >> _weapon;
private _magazine = getArray (_config >> "magazines") select 0;
_unit removeSecondaryWeaponItem _magazine;
_unit addMagazine _magazine;

[{currentWeapon (_this select 0) != (_this select 1)},
    {(_this select 0) removeMagazines (_this select 2)}, //Remove the magazine if the player doesn't load the launcher so it's not just hanging around in their inventory.
[_unit,_weapon,_magazine]] call CBA_fnc_waitUntilAndExecute;
