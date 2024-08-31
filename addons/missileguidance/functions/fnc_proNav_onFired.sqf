#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Sets up proportional navigation state arrays (called from missileGuidance's onFired).
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_missileguidance_fnc_proNav_onFired
 *
 * Public: No
 */
params ["_firedEH", "", "", "", "_stateParams"];
_firedEH params ["_shooter","","","","_ammo","","_projectile"];
_launchParams params ["_shooter","_targetLaunchParams","_seekerType","_attackProfile","_lockMode","_laserInfo","_navigationType"];
_targetLaunchParams params ["_target", "_targetPos", "_launchPos"];
_stateParams params ["_lastRunTime", "_seekerStateParams", "_attackProfileStateParams", "_lastKnownPosState"];      
_seekerParams params ["_seekerAngle", "_seekerAccuracy", "_seekerMaxRange", "_seekerMinRange"];

private _ammoConfig = configOf _projectile;
private _navigationGain = getNumber (_ammoConfig >> QUOTE(ADDON) >> "navigationGain");
if (_navigationGain == 0) then {
    _navigationGain = 3;
};

private _navigationParams = [
    [   // Last Missile Frame
        [0, 0, 0]   // Last line of sight
    ], 
    _navigationGain // navigation gain of missile. Set in the navigation onFired function
];
_navigationParams
