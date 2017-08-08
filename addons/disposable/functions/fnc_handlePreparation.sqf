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

if (!local _unit || !([_unit] call EFUNC(common,isPlayer)) || {_weapon != secondaryWeapon _unit} || {getNumber (configFile >> "CfgWeapons" >> _weapon >> "ACE_hasPreparation") != 1})  exitWith {};

private _config = configFile >> "CfgWeapons" >> _weapon;
private _magazine = getArray (_config >> "magazines") select 0;
_unit removeSecondaryWeaponItem _magazine;
_unit addMagazine _magazine;
[_unit,_weapon,_magazine] spawn {
		params["_unit","_weapon","_magazine"];

		waitUntil {currentWeapon _unit != _weapon};
		_unit removeSecondaryWeaponItem _magazine;
		_unit removeMagazines _magazine;
};
