#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Sets up wireGuided state arrays (called from missileGuidance's onFired).
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_missileguidance_fnc_wire_onFired
 *
 * Public: No
 */
params ["_firedEH", "", "", "_seekerParams", "_stateParams"];
_firedEH params ["_shooter","_weapon","","","","","_projectile", "_gunner"];
_stateParams params ["", "", "_attackProfileStateParams"];
_seekerParams params ["", "", "_seekerMaxRange", "_seekerMinRange"];

private _config = ([_projectile] call CBA_fnc_getObjectConfig) >> "ace_missileguidance";
private _maxCorrectableDistance = [_config >> "correctionDistance", "NUMBER", DEFAULT_CORRECTION_DISTANCE] call CBA_fnc_getConfigEntry;
private _distanceAheadOfMissile = [_config >> "missileLeadDistance", "NUMBER", DEFAULT_LEAD_DISTANCE] call CBA_fnc_getConfigEntry;
private _maxDistanceSqr = _seekerMaxRange * _seekerMaxRange;
private _minDistanceSqr = _seekerMinRange * _seekerMinRange;

// AI don't know how to use the crosshair offset becauze they dum dum
private _crosshairOffset = if ((_gunner != ACE_PLAYER) && {_gunner != (ACE_controlledUAV select 1)}) then {
    [0, 0, 0];
} else {
    [_config >> "offsetFromCrosshair", "ARRAY", [0, 0, 0]] call CBA_fnc_getConfigEntry
};

private _turretPath = [_shooter, _weapon] call CBA_fnc_turretPathWeapon;
private _turretConfig = [_shooter, _turretPath] call CBA_fnc_getTurret;

private _wireCutSource = _shooter selectionPosition getText(_turretConfig >> "missileEnd");

_attackProfileStateParams set [0, _maxCorrectableDistance];
_attackProfileStateParams set [1, false]; // _wireCut
_attackProfileStateParams set [2, [0, 0, 0]]; // _randomVector
_attackProfileStateParams set [3, _crosshairOffset]; // crosshair offset
_attackProfileStateParams set [4, _maxDistanceSqr]; // max distance squared used for wire cut
_attackProfileStateParams set [5, _minDistanceSqr];
_attackProfileStateParams set [6, _wireCutSource];
_attackProfileStateParams set [7, _distanceAheadOfMissile];

