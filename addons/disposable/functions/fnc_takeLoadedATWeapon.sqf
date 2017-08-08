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

params ["_unit"];
TRACE_1("params",_unit);

if (!local _unit) exitWith {};

if(getNumber (configFile >> "CfgWeapons" >> currentWeapon _unit >> "ACE_hasPreparation") != 1) then {
    {
        if(_x isKindOf ["ACE_PreloadedMissileDummy_Base", configFile >> "CfgMagazines"]) then {
            _unit removeMagazine _x;
        };
    } forEach magazines _unit; //I'm not a huge fan of this, but it's the fastest method I can find.
};

private _launcher = secondaryWeapon _unit;
private _config = configFile >> "CfgWeapons" >> _launcher;

if ([_unit] call EFUNC(common,isPlayer) && {getNumber (_config >> "ACE_hasPreparation") == 1}) exitWith{}; //Players with ACE_hasPreparation launchers stop here, but AI need to have ammo for their launchers in order to select them as weapons.

if (isClass _config && {getText (_config >> "ACE_UsedTube") != ""} && {getNumber (_config >> "ACE_isUsedLauncher") != 1} && {count secondaryWeaponMagazine _unit == 0}) then {
    private _magazine = getArray (_config >> "magazines") select 0;
    private _isLauncherSelected = currentWeapon _unit == _launcher;

    if (backpack _unit == "") then {
        _unit addBackpack "ACE_FakeBackpack";
        _unit removeWeapon _launcher;
        _unit addMagazine _magazine;
        private _didAdd = _magazine in magazines _unit;
        _unit addWeapon _launcher;

        if (!_didAdd) then {
            TRACE_1("Failed To Add Disposable Magazine Normally, doing backup method (no backpack)",_unit);
            _unit addSecondaryWeaponItem _magazine;
        };
        removeBackpack _unit;
    } else {
        _unit removeWeapon _launcher;
        _unit addMagazine _magazine;
        private _didAdd = _magazine in magazines _unit;
        _unit addWeapon _launcher;

        if (!_didAdd) then {
            TRACE_2("Failed To Add Disposable Magazine Normally, doing backup method",_unit,(backpack _unit));
            _unit addSecondaryWeaponItem _magazine;
        };
    };

    if (_isLauncherSelected) then {
        _unit selectWeapon _launcher;
    };
};
