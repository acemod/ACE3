#include "script_component.hpp"
/*
 * Author: mharis001
 * Text statement for the explosion time stat.
 *
 * Arguments:
 * 0: Stats Array (not used) <ARRAY>
 * 1: Item Config <CONFIG>
 *
 * Return Value:
 * Stat Text <STRING>
 *
 * Example:
 * [_stats, _config] call ace_arsenal_fnc_statTextStatement_explosionTime
 *
 * Public: No
 */

params ["", "_config"];

private _ammoConfig = configFile >> "CfgAmmo" >> getText (_config >> "ammo");
private _timeToLive = getNumber (_ammoConfig >> "timeToLive");
private _explosionTime = getNumber (_ammoConfig >> "explosionTime");

if (_explosionTime > _timeToLive) exitWith {
    "-" // Handle IR grenades
};

if (_explosionTime == -1) exitWith {
    localize LSTRING(DetonatesOnImpact)
};

format ["%1s", _explosionTime]
