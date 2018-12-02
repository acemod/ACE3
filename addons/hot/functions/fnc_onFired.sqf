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
private _maxCorrectableDistance = if (isNumber(_config >> "correctionDistance")) then { getNumber(_config >> "correctionDistance") } else { DEFAULT_CORRECTION_DISTANCE };
private _crosshairOffset = if (isArray(_config >> "offsetFromCrosshair")) then { getArray(_config >> "offsetFromCrosshair") } else { [0, 0, 0] };
private _maxDistance = _seekerMaxRange * _seekerMaxRange;

// AI don't know how to use the crosshair offset becauze they dum dum
if (_gunner != ACE_PLAYER) then {
    _crosshairOffset = [0, 0, 0];
};

 private _turretPath = [_shooter, _weapon] call CBA_fnc_turretPathWeapon;
private _turretConfig = [_shooter, _turretPath] call CBA_fnc_getTurret;

private _wireCutSource = _shooter selectionPosition getText(_turretConfig >> "missileEnd");

_attackProfileStateParams set [0, _maxCorrectableDistance];
_attackProfileStateParams set [1, false]; // _wireCut
_attackProfileStateParams set [2, [0, 0, 0]]; // _randomVector
_attackProfileStateParams set [3, _crosshairOffset]; // crosshair offset
_attackProfileStateParams set [4, _maxDistance]; // max distance squared used for wire cut
_attackProfileStateParams set [5, _wireCutSource];
_memoryPointGunnerOptics = getText(_turretConfig >> "memoryPointGunnerOptics");
_seekerStateParams set [0, _turretPath];
_seekerStateParams set [1, _memoryPointGunnerOptics];

