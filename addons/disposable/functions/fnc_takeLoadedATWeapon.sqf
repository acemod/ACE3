/*
 * Author: commy2
 * Handle the take event. Add a dummy magazine if a disposable rocket launcher is taken.
 *
 * Arguments:
 * 0: unit - Object the event handler is assigned to <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [fromTakeEH] call ace_disposable_fnc_takeLoadedATWeapon;
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_unit", "_launcher", "_config"];

params ["_unit"];

if (!local _unit) exitWith {};

_launcher = secondaryWeapon _unit;
_config = configFile >> "CfgWeapons" >> _launcher;

if (isClass _config && {getText (_config >> "ACE_UsedTube") != ""} && {getNumber (_config >> "ACE_isUsedLauncher") != 1} && {count secondaryWeaponMagazine _unit == 0}) then {
    private ["_magazine", "_isLauncherSelected"];

    _magazine = getArray (_config >> "magazines") select 0;

    _isLauncherSelected = currentWeapon _unit == _launcher;

    _unit removeMagazines _magazine;

    if (backpack _unit == "") then {
        _unit addBackpack "Bag_Base";

        _unit addMagazine _magazine;
        _unit addWeapon _launcher;

        removeBackpack _unit;
    } else {
        _unit addMagazine _magazine;
        _unit addWeapon _launcher;
    };

    if (_isLauncherSelected) then {
        _unit selectWeapon _launcher;
    };
};
