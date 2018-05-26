/*
 * Author: Dystopian, optimized by Anton
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
#include "script_component.hpp"

params ["_enabled"];

if (!_enabled) exitWith {
    if (isNil QGVAR(laserKeyDownEH)) exitWith {};
    ["KeyDown", GVAR(laserKeyDownEH)] call CBA_fnc_removeDisplayHandler;
    ["loadout", GVAR(laserLoadoutEH)] call CBA_fnc_removePlayerEventHandler;
    ["turret", GVAR(laserTurretEH)] call CBA_fnc_removePlayerEventHandler;
    ["vehicle", GVAR(laserVehicleEH)] call CBA_fnc_removePlayerEventHandler;
    ["weapon", GVAR(laserWeaponEH)] call CBA_fnc_removePlayerEventHandler;
};

GVAR(laserKeyDownEH) = ["KeyDown", {
    if !((_this select 1) in actionKeys "headlights") exitWith {false};
    private _unit = ACE_player;
    private _weapon = currentWeapon _unit;
    [
        {
            params ["_weapon", "_laserWasEnabled"];
            private _laserEnabled = _unit isIRLaserOn _weapon || {_unit isFlashlightOn _weapon};
            if (_laserEnabled && {_laserWasEnabled} || {!_laserEnabled && {!_laserWasEnabled}}) exitWith {};
            private _weaponIndex = [_unit, _weapon] call FUNC(getWeaponIndex);
            _unit setVariable [QGVAR(laserEnabled_) + str _weaponIndex, [nil, true] select _laserEnabled];
        },
        [_weapon, _unit isIRLaserOn _weapon || {_unit isFlashlightOn _weapon}]
    ] call CBA_fnc_execNextFrame;
    false
}] call CBA_fnc_addDisplayHandler;

private _laserEH = {
    if (sunOrMoon == 1) exitWith {};
    params ["_player"];
    private _weaponIndex = [_player, currentWeapon _player] call FUNC(getWeaponIndex);
    if (
        !(_player getVariable [QGVAR(laserEnabled_) + str _weaponIndex, false])
        || {_weaponIndex > 0 && {"" != primaryWeapon _player}} // Arma switches to primary weapon if exists
        || {!(_player call CBA_fnc_canUseWeapon)} // ignore in vehicle except FFV
    ) exitWith {};
    [
        // wait for weapon in "ready to fire" direction
        {0.01 > getCameraViewDirection _this vectorDistance (_this weaponDirection currentWeapon _this)},
        {{_this action [_x, _this]} forEach ["GunLightOn", "IRLaserOn"]},
        _player,
        3,
        {{_this action [_x, _this]} forEach ["GunLightOn", "IRLaserOn"]}
    ] call CBA_fnc_waitUntilAndExecute;
};

GVAR(laserLoadoutEH) = ["loadout", _laserEH] call CBA_fnc_addPlayerEventHandler;
GVAR(laserTurretEH) = ["turret", _laserEH] call CBA_fnc_addPlayerEventHandler;
GVAR(laserVehicleEH) = ["vehicle", _laserEH] call CBA_fnc_addPlayerEventHandler;
GVAR(laserWeaponEH) = ["weapon", _laserEH] call CBA_fnc_addPlayerEventHandler;
