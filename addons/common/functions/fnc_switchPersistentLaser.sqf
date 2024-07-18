#include "..\script_component.hpp"
/*
 * Author: Dystopian, johnb43
 * Controls persistent laser state.
 *
 * Arguments:
 * 0: Enabled <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * true call ace_common_fnc_switchPersistentLaser
 *
 * Public: No
 */

params ["_enabled"];

if (!hasInterface) exitwith {};

// Reset state
{
    ACE_player setVariable [QGVAR(laserEnabled_) + str _x, nil];
} forEach [0, 1, 2];

if (!_enabled) exitWith {
    if (isNil QGVAR(laserKeyDownEH)) exitWith {};

    removeUserActionEventHandler ["headlights", "Activate", GVAR(laserKeyDownEH)];

    ["loadout", GVAR(laserLoadoutEH)] call CBA_fnc_removePlayerEventHandler;
    ["turret", GVAR(laserTurretEH)] call CBA_fnc_removePlayerEventHandler;
    ["vehicle", GVAR(laserVehicleEH)] call CBA_fnc_removePlayerEventHandler;
    ["weapon", GVAR(laserWeaponEH)] call CBA_fnc_removePlayerEventHandler;
};

private _fnc_getLightLaserState = {
    private _currentWeapon = currentWeapon ACE_player;

    if (_currentWeapon == "") exitWith {};

    // Ignore in vehicle except FFV
    if !(ACE_player call CBA_fnc_canUseWeapon) exitWith {};

    private _weaponIndex = [ACE_player, _currentWeapon] call FUNC(getWeaponIndex);

    if (_weaponIndex == -1) exitWith {};

    // Light/laser state only changes in the next frame
    [{
        ACE_player setVariable [
            QGVAR(laserEnabled_) + str (_this select 1),
            ACE_player isIRLaserOn (_this select 0) || {ACE_player isFlashlightOn (_this select 0)}
        ];
    }, [_currentWeapon, _weaponIndex]] call CBA_fnc_execNextFrame;
};

// Get current weapon light/laser state
call _fnc_getLightLaserState;

// Update state every time it's changed
GVAR(laserKeyDownEH) = addUserActionEventHandler ["headlights", "Activate", _fnc_getLightLaserState];

// Dropping weapons turns off lights/lasers
GVAR(lastWeapons) = [primaryWeapon ACE_player, handgunWeapon ACE_player, secondaryWeapon ACE_player];

// Monitor weapon addition/removal here
GVAR(laserLoadoutEH) = ["loadout", {
    params ["_unit"];

    private _weapons = [primaryWeapon _unit, handgunWeapon _unit, secondaryWeapon _unit];

    if (_weapons isEqualTo GVAR(lastWeapons)) exitWith {};

    GVAR(lastWeapons) = _weapons;

    _unit call FUNC(switchPersistentLaserEH);
}] call CBA_fnc_addPlayerEventHandler;

GVAR(laserTurretEH) = ["turret", LINKFUNC(switchPersistentLaserEH)] call CBA_fnc_addPlayerEventHandler;
GVAR(laserVehicleEH) = ["vehicle", LINKFUNC(switchPersistentLaserEH)] call CBA_fnc_addPlayerEventHandler;
GVAR(laserWeaponEH) = ["weapon", LINKFUNC(switchPersistentLaserEH)] call CBA_fnc_addPlayerEventHandler;
