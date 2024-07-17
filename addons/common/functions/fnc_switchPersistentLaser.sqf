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

    // Light/laser state only changes in the next frame
    [{
        private _weaponIndex = [ACE_player, _this] call FUNC(getWeaponIndex);
        
        if (_index == -1) exitWith {};
        
        ACE_player setVariable [
            QGVAR(laserEnabled_) + str _weaponIndex,
            ACE_player isIRLaserOn _this || {ACE_player isFlashlightOn _this}
        ];
    }, _currentWeapon] call CBA_fnc_execNextFrame;
};

// Get current weapon light/laser state
call _fnc_getLightLaserState;

// Update state every time it's changed
GVAR(laserKeyDownEH) = addUserActionEventHandler ["headlights", "Activate", _fnc_getLightLaserState];

private _fnc_lightLaserEH = {
    params ["_unit"];

    if !(_unit call CBA_fnc_canUseWeapon) exitWith {};

    // Save current weapon state to reapply later
    private _weaponState = (weaponState _unit) select [0, 3];

    if (_weaponState select 0 == "") exitWith {};

    // Turn off old light/laser
    action ["GunLightOff", _unit];
    action ["IRLaserOff", _unit];

    // Light/laser is off
    if !(_unit getVariable ["ace_common_laserEnabled_" + str ([_unit, _weaponState select 0] call EFUNC(common,getWeaponIndex)), false]) exitWith {
        _unit selectWeapon _weaponState;
    };

    private _fnc_turnOnLightLaser = {
        params ["_unit", "_weaponState"];

        if (currentWeapon _unit != _weaponState select 0) exitWith {};

        action ["GunLightOn", _unit];
        action ["IRLaserOn", _unit];

        _unit selectWeapon _weaponState;
    };

    [
        // Wait for weapon in "ready to fire" direction
        // If the unit changes weapons during the transition, let weapon EH handle it
        {
            params ["_unit", "_weaponState"];

            private _currentWeapon = currentWeapon _unit;

            _currentWeapon != _weaponState select 0 ||
            {0.01 > (getCameraViewDirection _unit) vectorDistance (_unit weaponDirection _currentWeapon)}
        },
        _fnc_turnOnLightLaser,
        [_unit, _weaponState],
        3,
        _fnc_turnOnLightLaser
    ] call CBA_fnc_waitUntilAndExecute;
};

// Dropping weapons turns off lights/lasers
GVAR(laserLoadoutEH) = ["loadout", _fnc_lightLaserEH] call CBA_fnc_addPlayerEventHandler;
GVAR(laserTurretEH) = ["turret", _fnc_lightLaserEH] call CBA_fnc_addPlayerEventHandler;
GVAR(laserVehicleEH) = ["vehicle", _fnc_lightLaserEH] call CBA_fnc_addPlayerEventHandler;
GVAR(laserWeaponEH) = ["weapon", _fnc_lightLaserEH] call CBA_fnc_addPlayerEventHandler;
