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
 params ["_firedEH", "", "", "", "_stateParams"];
_firedEH params ["_shooter","_weapon","","","","","_projectile"];
_stateParams params ["", "_seekerStateParams", "_attackProfileStateParams"];

private _config = ([_projectile] call CBA_fnc_getObjectConfig) >> "ace_missileguidance" >> QGVAR(correctionDistance);
private _maxCorrectableDistance = if (isNumber(_config)) then { getNumber(_config) } else { DEFAULT_CORRECTION_DISTANCE };
_attackProfileStateParams set [0, _maxCorrectableDistance];
 private _turretPath = [_shooter, _weapon] call CBA_fnc_turretPathWeapon;
_memoryPointGunnerOptics = getText(([_shooter, _turretPath] call CBA_fnc_getTurret) >> "memoryPointGunnerOptics");
_seekerStateParams set [0, false]; // _wireCut
_seekerStateParams set [1, [0, 0, 0]]; // _randomVector
_seekerStateParams set [2, _turretPath];
_seekerStateParams set [3, _memoryPointGunnerOptics];

