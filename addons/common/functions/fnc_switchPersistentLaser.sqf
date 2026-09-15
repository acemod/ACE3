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

if (!hasInterface) exitWith {};

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

    GVAR(laserKeyDownEH) = nil;
    GVAR(laserLoadoutEH) = nil;
    GVAR(laserTurretEH) = nil;
    GVAR(laserVehicleEH) = nil;
    GVAR(laserWeaponEH) = nil;
};

private _fnc_getLightLaserState = {
    private _currentWeapon = currentWeapon ACE_player;

    if (_currentWeapon == "") exitWith {};

    // Ignore in vehicle except FFV
    if !(ACE_player call CBA_fnc_canUseWeapon) exitWith {};

    private _weaponIndex = [ACE_player, _currentWeapon] call FUNC(getWeaponIndex);

    if (_weaponIndex == -1) exitWith {};

    // Light/laser state only changes in the next frame
    // However, as by default changing attachment modes is CTRL + L, the vanilla EH triggers when lights are bound to L (even despite CBA intercepting keystroke)
    // Therefore, add an extra frame of delay, after which the previous laser state will have been restored
    [{
        ACE_player setVariable [
            QGVAR(laserEnabled_) + str (_this select 1),
            ACE_player isIRLaserOn (_this select 0) || {ACE_player isFlashlightOn (_this select 0)}
        ];
    }, [_currentWeapon, _weaponIndex], 2] call CBA_fnc_execAfterNFrames;
};

// Get current weapon light/laser state
call _fnc_getLightLaserState;

// Update state every time it's changed
GVAR(laserKeyDownEH) = addUserActionEventHandler ["headlights", "Activate", _fnc_getLightLaserState];

// Dropping weapons, as well as switching light/laser attachments turns off lights/lasers
GVAR(lastWeapons) = (getUnitLoadout ACE_player) select [0, 3];

// Monitor weapon addition/removal here
GVAR(laserLoadoutEH) = ["loadout", {
    params ["_unit", "_loadout"];

    private _weapons = _loadout select [0, 3];

    if (_weapons isEqualTo GVAR(lastWeapons)) exitWith {};

    GVAR(lastWeapons) = _weapons;

    [
        _unit,
        _unit getVariable [QGVAR(laserEnabled_) + str ([_unit, currentWeapon _unit] call FUNC(getWeaponIndex)), false]
    ] call FUNC(setWeaponLightLaserState);
}] call CBA_fnc_addPlayerEventHandler;

private _fnc_switchPersistentLaserEH = {
    params ["_unit"];

    [
        _unit,
        _unit getVariable [QGVAR(laserEnabled_) + str ([_unit, currentWeapon _unit] call FUNC(getWeaponIndex)), false]
    ] call FUNC(setWeaponLightLaserState);
};

GVAR(laserTurretEH) = ["turret", _fnc_switchPersistentLaserEH] call CBA_fnc_addPlayerEventHandler;
GVAR(laserVehicleEH) = ["vehicle", _fnc_switchPersistentLaserEH] call CBA_fnc_addPlayerEventHandler;
GVAR(laserWeaponEH) = ["weapon", _fnc_switchPersistentLaserEH] call CBA_fnc_addPlayerEventHandler;
