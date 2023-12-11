#include "..\script_component.hpp"
/*
 * Author: mharis001
 * Text statement for the explosion time stat.
 *
 * Arguments:
 * 0: Not used
 * 1: Item config path <CONFIG>
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
TRACE_1("statTextStatement_explosionTime",_config);

private _ammoConfig = configFile >> "CfgAmmo" >> getText (_config >> "ammo");
private _timeToLive = getNumber (_ammoConfig >> "timeToLive");
private _explosionTime = getNumber (_ammoConfig >> "explosionTime");

// Handle IR grenades
if (_explosionTime > _timeToLive) exitWith {
    "-"
};

if (_explosionTime == -1) exitWith {
    LLSTRING(DetonatesOnImpact)
};

format ["%1s", _explosionTime]
