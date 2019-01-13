#include "script_component.hpp"
/*
 * Author: Brandon (TCVM) (Code inspired by NouberNou's Dragon Guidance)
 * Attack profile: Dragon Guidance
 *
 * Arguments:
 * 0: Seeker Target PosASL <ARRAY>
 * 1: Guidance Arg Array <ARRAY>
 * 2: Attack Profile State <ARRAY>
 *
 * Return Value:
 * Missile Aim PosASL <ARRAY> - Unused
 *
 * Example:
 * [[1,2,3], [], []] call ace_hot_fnc_attackProfile_WIRE;
 *
 * Public: No
 *
 */
params ["_seekerTargetPos", "_args", "_attackProfileStateParams"];
_args params ["_firedEH", "", "", "", "_stateParams"];
_firedEH params ["_shooter","_weapon","","","","","_projectile"];
_attackProfileStateParams params["_maxCorrectableDistance", "_wireCut", "_randomVector", "_seekerMaxRangeSqr", "_seekerMinRangeSqr", "_wireCutSource", "_lastTime", "_serviceInterval", "_serviceChargeCount", "_serviceChargeAcceleration", "_dragonSpeed"];

systemChat str(_attackProfileStateParams);

private _projectilePos = getPosASL _projectile;
private _distanceToProjectile = (getPosASL _shooter) vectorDistanceSqr _projectilePos;

if (_distanceToProjectile <= _seekerMinRangeSqr) exitWith { _projectilePos vectorAdd (AGLtoASL (_projectile vectorModelToWorld [0, 50, 0])) };

if ((_distanceToProjectile > _seekerMaxRangeSqr) || { _wireCut }) exitWith {
    // wire snap, random direction
    if (_randomVector isEqualTo [0, 0, 0]) then {
        _randomVector = RANDOM_VECTOR_3D vectorMultiply 300;
        _attackProfileStateParams set [1, true];
        _attackProfileStateParams set [2, _randomVector];

        playSound3D ["a3\sounds_f\air\sfx\SL_rope_break.wss", objNull, false, AGLtoASL (_shooter modelToWorld _wireCutSource), 150, 1, 25];
    };
    _projectilePos vectorAdd _randomVector
};

// if the time between updates is less than the pop time we want to fire the rockets OR if the missile wants to make a major correction pop it rapidly
if (((_lastTime - CBA_missionTime) <= 0) || {(_lastTime - CBA_missionTime) < (_serviceInterval / 2) && (_projectilePos vectorDistance _seekerTargetPos > 1)}) then {
    _attackProfileStateParams set [6, CBA_missionTime + _serviceInterval];
    
    private _vectorToCrosshair = vectorNormalized (_projectile worldToModel (ASLToAGL _seekerTargetPos));
    private _vectorToPos = vectorNormalized (((_projectile vectorWorldToModelVisual (_shooter weaponDirection _weapon)) vectorMultiply (_dragonSpeed * _serviceInterval)) vectorAdd (_vectorToCrosshair vectorMultiply _maxCorrectableDistance));
    
    if ((_vectorToPos select 2) < 0) then {
        _vectorToPos set [2, 0];
    };
    
    _projectile setVelocityModelSpace ((velocityModelSpace _projectile) vectorAdd (_vectorToPos vectorMultiply _serviceChargeAcceleration));
    
    private _charge = createVehicle ["ace_m47_dragon_serviceCharge", [0, 0, 0], [], 0, "NONE"];
    _charge setPosASL (_projectilePos vectorAdd ((_vectorToCrosshair vectorMultiply -1) vectorMultiply 0.025));
};

// Return position in-front of projectile. Because we simulate the velocity updates in this function we dont want missile guidance taking over
_projectilePos vectorAdd (AGLtoASL (_projectile vectorModelToWorld [0, 50, 0]))
