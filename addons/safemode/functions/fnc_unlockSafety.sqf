#include "..\script_component.hpp"
/*
 * Author: commy2, johnb43
 * Takes the weapon safety lock off.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 * 2: Muzzle <STRING>
 * 3: Show hint <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player, currentWeapon ACE_player, currentMuzzle ACE_player] call ace_safemode_fnc_unlockSafety
 *
 * Public: No
 */

params ["_unit", "_weapon", "_muzzle", ["_hint", true]];

private _safedWeaponMuzzles = (_unit getVariable QGVAR(safedWeapons)) get _weapon;
private _firemode = _safedWeaponMuzzles deleteAt _muzzle;

// Remove action if all weapons have removed their safeties
if (_safedWeaponMuzzles isEqualTo createHashMap) then {
    (_unit getVariable QGVAR(safedWeapons)) deleteAt _weapon;

    private _ehID = _unit getVariable QGVAR(actionID);

    if (!isNil "_ehID" && {(_unit getVariable QGVAR(safedWeapons)) isEqualTo createHashMap}) then {
        [_unit, "DefaultAction", _ehID] call EFUNC(common,removeActionEventHandler);

        _unit setVariable [QGVAR(actionID), nil];
    };
};

private _weaponSelected = currentWeapon _unit == _weapon;

// Let engine handle switching to next firemode/muzzle
if (_weaponSelected && {inputAction "nextWeapon" == 0} && {inputAction "prevWeapon" == 0}) then {
    // This syntax of selectWeapon doesn't mess with gun lights and lasers
    _unit selectWeapon [_weapon, _muzzle, _firemode];

    // Play fire mode selector sound
    [_unit, _weapon, _muzzle] call FUNC(playChangeFiremodeSound);
};

// Player HUD
if (_weaponSelected) then {
    true call FUNC(setSafeModeVisual);
};

// Show info box unless disabled
if (_hint) then {
    [LLSTRING(TookOffSafety), getText (configFile >> "CfgWeapons" >> _weapon >> "picture")] call EFUNC(common,displayTextPicture);
};
