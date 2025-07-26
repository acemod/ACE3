#include "..\script_component.hpp"
/*
 * Author: Dslyecxi, Jonpas
 * Primes the throwable, creates global throwable vehicle and throws Fired XEH.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Show Hint <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit] call ace_advanced_throwing_fnc_prime
 *
 * Public: No
 */

params ["_unit", ["_showHint", false]];
TRACE_2("params",_unit,_showHint);

_unit setVariable [QGVAR(primed), true];

// Remove item before cooking to prevent weaponselect showing more throwables than there actually are in inventory
private _throwableMag = (currentThrowable _unit) select 0;
private _config = configFile >> "CfgMagazines" >> _throwableMag;

(_unit getVariable [QGVAR(activeMuzzle), ["", -1]]) params ["_muzzle", "_ammoCount"];

// If there is 1 "round" left in the grenade, remove it from the player's inventory
if (_ammoCount == 1 || {getNumber (_config >> "count") == 1}) then {
    // Grenade has ammo set to 0, so remove that one specifically
    private _ret = [_unit, _throwableMag, 0] call EFUNC(common,removeSpecificMagazine);
    if (!_ret) then {
        [_unit, _throwableMag] call CBA_fnc_removeMagazine;
    };

    // Get ammo count of new magazine
    _unit setVariable [QGVAR(activeMuzzle), [_muzzle, _unit ammo _muzzle]];
} else {
    if (_ammoCount > 1 && {getNumber (_config >> "count") > 1}) then {
        _unit setVariable [QGVAR(activeMuzzle), [_muzzle, _ammoCount - 1]];
    };
};

// Set muzzle ammo to 0 to block vanilla throwing, removing magazine above resets it
_unit setAmmo [_muzzle, 0];

private _throwableType = getText (_config >> "ammo");
private _ammoConfig = configFile >> "CfgAmmo" >> _throwableType;

// Handle weird scripted grenades (RHS) which could cause unexpected behaviour
if (inheritsFrom (_ammoConfig >> QGVAR(replaceWith)) isEqualTo _ammoConfig) then {
    _throwableType = getText (_ammoConfig >> QGVAR(replaceWith));
};

// Create actual throwable globally
private _activeThrowableOld = _unit getVariable [QGVAR(activeThrowable), objNull];
private _activeThrowable = createVehicle [_throwableType, _activeThrowableOld, [], 0, "CAN_COLLIDE"];
_unit setVariable [QGVAR(activeThrowable), _activeThrowable];
deleteVehicle _activeThrowableOld;

// Set _gunner for Throw Fired XEH
private _gunner = _unit;

// Throw Fired XEH
[QGVAR(throwFiredXEH), [
    _unit, // unit
    "Throw", // weapon
    _muzzle, // muzzle
    _muzzle, // mode
    _throwableType, // ammo
    _throwableMag, // magazine
    _activeThrowable, // projectile
    _gunner // gunner
]] call CBA_fnc_globalEvent;

// Set prime instigator
[QEGVAR(common,setShotParents), [_activeThrowable, _unit, _unit]] call CBA_fnc_serverEvent;

if (_showHint) then {
    // Show primed hint
    private _displayNameShort = getText (_config >> "displayNameShort");
    private _picture = getText (_config >> "picture");

    [[_displayNameShort, LLSTRING(Primed)] joinString " ", _picture] call EFUNC(common,displayTextPicture);

    // Change controls hint for RMB
    call FUNC(updateControlsHint);
};
