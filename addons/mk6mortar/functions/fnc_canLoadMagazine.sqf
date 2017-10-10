/*
 * Author: Grey
 * Checks whether magazine can be loaded into static weapon
 *
 * Arguments:
 * 0: static <OBJECT>
 * 1: unit <OBJECT>
 * 2: magazine class to check; if not given having any compatible magazine returns true <STRING> (default: "")
 *
 * Return Value:
 * canLoadMagazine <BOOL>
 *
 * Example:
 * [_target,_player,"ACE_1Rnd_82mm_Mo_HE"] call ace_mk6mortar_fnc_canLoadMagazine
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_static","_unit",["_magazineClassOptional","",[""]]];

if !(alive _static && GVAR(useAmmoHandling)) exitWith {false};

private _canLoadMagazine = false;
private _hasCompatibleMagazine = false;

private _currentMagazine = (magazinesAllTurrets _static) select 1;
private _weapon = (_static weaponsTurret [0]) select 0;

private _listOfMagNames = getArray(configFile >> "cfgWeapons" >> _weapon >> "magazines");
private _count = 0;

//If function is called with an optional string then check if player has that magzine otherwise check all magazines of the player to see if they are compatible with the static weapon
if (_magazineClassOptional != "") then {
    if ([_unit,_magazineClassOptional] call EFUNC(common,hasMagazine)) then {
        _hasCompatibleMagazine = true;
    };
 } else {
    {
        if ([_unit,_x] call EFUNC(common,hasMagazine)) exitWith {_hasCompatibleMagazine = true};
    } forEach _listOfMagNames;
};
//If static weapon has a magazine then find the ammo count
if (count (_static magazinesTurret [0]) > 0) then {
    _count = _currentMagazine select 2;
};
//If the static weapon doesn't have a magzine or a magazine with no bullets, the player has a compatible magazine and the static weapon has a barrel then you can load a magazine
if ((count (_static magazinesTurret [0]) == 0 || _count == 0 ) && _hasCompatibleMagazine) then {
    _canLoadMagazine = true;
};
_canLoadMagazine
