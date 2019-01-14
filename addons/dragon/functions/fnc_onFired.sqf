#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Runs when Dragon is fired
 *
 * Arguments:
 * 0: None
 * 1: The weapon that was fired <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [any, vehicle player] call ace_dragon_fnc_onFired;
 *
 * Public: No
 */
params ["_firedEH", "", "", "_seekerParams", "_stateParams"];
_firedEH params ["_shooter","_weapon","","","","","_projectile"];
_stateParams params ["", "", "_attackProfileStateParams"];
_seekerParams params ["", "", "_seekerMaxRange", "_seekerMinRange"];

_shooter setVariable [QGVAR(fired), true, true];
_shooter animate ["missile_hide", 1];

private _config = ([_projectile] call CBA_fnc_getObjectConfig) >> "ace_missileguidance";

private _serviceInterval = [_config >> "serviceInterval", "NUMBER", 0.33] call CBA_fnc_getConfigEntry;
private _serviceChargeCount = [_config >> "serviceCharges", "NUMBER", 60] call CBA_fnc_getConfigEntry;
private _serviceChargeAcceleration = [_config >> "serviceChargeAcceleration", "NUMBER", 6.5] call CBA_fnc_getConfigEntry;
private _dragonSpeed = [_config >> "dragonSpeed", "NUMBER", 100] call CBA_fnc_getConfigEntry;
private _maxCorrectableDistance = [_config >> "correctionDistance", "NUMBER", DEFAULT_CORRECTION_DISTANCE] call CBA_fnc_getConfigEntry;
private _maxDistanceSqr = _seekerMaxRange * _seekerMaxRange;
private _minDistanceSqr = _seekerMinRange * _seekerMinRange;

private _turretPath = [_shooter, _weapon] call CBA_fnc_turretPathWeapon;
private _turretConfig = [_shooter, _turretPath] call CBA_fnc_getTurret;

private _wireCutSource = _shooter selectionPosition getText(_turretConfig >> "missileEnd");

_attackProfileStateParams append [
    _maxCorrectableDistance,
    false,
    _maxDistanceSqr,
    _minDistanceSqr,
    _wireCutSource,
    CBA_missionTime,
    _serviceInterval,
    _serviceChargeCount,
    _serviceChargeAcceleration,
    _dragonSpeed
];

