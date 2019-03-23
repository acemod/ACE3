#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Sets up missile guidance state arrays (called from missileGuidance's onFired).
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_hot_fnc_onFired
 *
 * Public: No
 */
params ["_firedEH", "", "", "_seekerParams", "_stateParams"];
_firedEH params ["_shooter","_weapon","","","","","_projectile", "_gunner"];
_stateParams params ["", "_seekerStateParams", "_attackProfileStateParams"];
_seekerParams params ["", "", "_seekerMaxRange"];

private _config = ([_projectile] call CBA_fnc_getObjectConfig) >> "ace_missileguidance";
private _maxCorrectableDistance = [_config >> "correctionDistance", "NUMBER", DEFAULT_CORRECTION_DISTANCE] call CBA_fnc_getConfigEntry;
private _crosshairOffset = [_config >> "offsetFromCrosshair", "ARRAY", [0, 0, 0]] call CBA_fnc_getConfigEntry;
private _maxDistanceSqr = _seekerMaxRange * _seekerMaxRange;
private _distanceAheadOfMissile = [_config >> "missileLeadDistance", "NUMBER", DEFAULT_LEAD_DISTANCE] call CBA_fnc_getConfigEntry;

// AI don't know how to use the crosshair offset becauze they dum dum
if ((_gunner != ACE_PLAYER) && {_gunner != (ACE_controlledUAV select 1)}) then {
    _crosshairOffset = [0, 0, 0];
};
if (_shooter isKindOf "Plane") then {WARNING("SACLOS fired from planes unsupported");};

private _turretPath = [_shooter, _weapon] call CBA_fnc_turretPathWeapon;
private _turretConfig = [_shooter, _turretPath] call CBA_fnc_getTurret;

private _wireCutSource = _shooter selectionPosition getText(_turretConfig >> "missileEnd");

_attackProfileStateParams set [0, _maxCorrectableDistance];
_attackProfileStateParams set [1, false]; // _wireCut
_attackProfileStateParams set [2, [0, 0, 0]]; // _randomVector
_attackProfileStateParams set [3, _crosshairOffset]; // crosshair offset
_attackProfileStateParams set [4, _maxDistanceSqr]; // max distance squared used for wire cut
_attackProfileStateParams set [5, _wireCutSource];

private _memoryPointGunnerOptics = getText(_turretConfig >> "memoryPointGunnerOptics");
private _animationSourceBody = getText(_turretConfig >> "animationSourceBody");
private _animationSourceGun = getText(_turretConfig >> "animationSourceGun");
_seekerStateParams set [0, _memoryPointGunnerOptics];
_seekerStateParams set [1, _animationSourceBody];
_seekerStateParams set [2, _animationSourceGun];
_seekerStateParams set [3, _distanceAheadOfMissile];

