#include "script_component.hpp"
/*
 * Author: Ir0n1E and mjc4wilton
 * Swap primary weapon and weapon in gunbag.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, target] call ace_gunbag_fnc_swapGunbag
 *
 * Public: No
 */

params ["_unit", "_target"];
private _currentWeapon = primaryWeapon _unit; //Get Current Weapon
private _gunbag = backpackContainer _target;


//---Set up current weapon for storing
private _currentWeaponState = [_unit, _currentWeapon] call EFUNC(common,getWeaponState); //Gets weapon attachments

/*
 * example return value _state
 * [["","","optic_Aco",""],["arifle_MX_GL_ACO_F","GL_3GL_F"],["30Rnd_65x39_caseless_mag","1Rnd_HE_Grenade_shell"],[30,1]]
 */

_currentWeaponState params ["_currentWeaponItems", "", "_currentWeaponMagazines", "_currentWeaponAmmo"]; //Extract Weapon Attachments to separate arrays

private _currentWeaponMass = [_currentWeapon, _currentWeaponItems, _currentWeaponMagazines] call FUNC(calculateMass);

{
    _currentWeaponMagazines set [_forEachIndex, [_x, _currentWeaponAmmo select _forEachIndex]];
} forEach _currentWeaponMagazines;

//---Set up weapon in gunbag
private _newWeaponState = _gunbag getVariable [QGVAR(gunbagWeapon), []];

if (_newWeaponState isEqualTo []) exitWith {
    [LLSTRING(empty)] call EFUNC(common,displayTextStructured);
};

_newWeaponState params ["_newWeapon", "_newWeaponItems", "_newWeaponMagazines"];

//---Swap Weapons
_unit removeWeapon _currentWeapon;
_unit addWeapon _newWeapon;

// Game will auto add magazines from player's inventory, put these back in player inventory as they will be overwritten
([_unit, _newWeapon] call EFUNC(common,getWeaponState)) params ["", "", "_addedMags", "_addedAmmo"];
{
    if (((_x select 0) != "") && {(_addedMags select _forEachIndex) != ""}) then {
        TRACE_2("Re-adding mag",_x,_addedMags select _forEachIndex);
        _unit addMagazine [_addedMags select _forEachIndex, _addedAmmo select _forEachIndex];
    };
} forEach _newWeaponMagazines;

removeAllPrimaryWeaponItems _unit;

{
    _unit addWeaponItem [_newWeapon, _x];
} forEach (_newWeaponItems + _newWeaponMagazines);

_unit selectWeapon _newWeapon;

_newWeaponMagazines = _newWeaponMagazines apply {_x select 0};

private _newWeaponMass = [_newWeapon, _newWeaponItems, _newWeaponMagazines] call FUNC(calculateMass);

// update virtual load
[_target, _gunbag, _currentWeaponMass - _newWeaponMass] call EFUNC(movement,addLoadToUnitContainer);
_gunbag setVariable [QGVAR(gunbagWeapon), [_currentWeapon, _currentWeaponItems, _currentWeaponMagazines], true]; //Replace weapon in gunbag
