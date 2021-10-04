#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Sets up SACLOS state arrays (called from missileGuidance's onFired).
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_missileguidance_fnc_SACLOS_onFired
 *
 * Public: No
 */
params ["_firedEH", "", "", "", "_stateParams"];
_firedEH params ["_shooter","_weapon","","","","","_projectile"];
_stateParams params ["", "_seekerStateParams"];

private _usePilotCamera = getNumber (configOf _shooter >> "pilotCamera" >> QGVAR(usePilotCameraForTargeting)) == 1;

private _turretPath = [_shooter, _weapon] call CBA_fnc_turretPathWeapon;
private _turretConfig = [_shooter, _turretPath] call CBA_fnc_getTurret;
private _memoryPointGunnerOptics = getText(_turretConfig >> "memoryPointGunnerOptics");
private _animationSourceBody = getText(_turretConfig >> "animationSourceBody");
private _animationSourceGun = getText(_turretConfig >> "animationSourceGun");

_seekerStateParams set [0, _memoryPointGunnerOptics];
_seekerStateParams set [1, _animationSourceBody];
_seekerStateParams set [2, _animationSourceGun];
_seekerStateParams set [3, _usePilotCamera || { (_shooter isKindOf "Plane") && hasPilotCamera _shooter }];

if ((_shooter isKindOf "Plane") && !hasPilotCamera _shooter) then { WARNING("SACLOS fired from planes without pilot camera unsupported!"); };

