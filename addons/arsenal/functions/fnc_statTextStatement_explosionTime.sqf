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

private _explosionTime = getNumber (configFile >> "CfgAmmo" >> getText (_config >> "ammo") >> "explosionTime");

if (_explosionTime == -1) exitWith {
    localize LSTRING(DetonatesOnImpact)
};

format ["%1s", _explosionTime]
