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
 * [[1,2,3], [], []] call ace_dragon_fnc_attackProfile_DRAGON;
 *
 * Public: No
 */
params ["_seekerTargetPos", "_args", "_attackProfileStateParams"];
_args params ["_firedEH", "", "", "", "_stateParams"];
_firedEH params ["_shooter","_weapon","","","","","_projectile"];
_attackProfileStateParams params ["_maxCorrectableDistance", "_wireCut", "_seekerMaxRangeSqr", "_seekerMinRangeSqr", "_wireCutSource", "_lastTime", "_serviceInterval", "_serviceChargeCount", "_serviceChargeAcceleration", "_dragonSpeed"];

private _projectilePos = getPosASL _projectile;
private _distanceToProjectile = (getPosASL _shooter) vectorDistanceSqr _projectilePos;
private _retPos = _projectilePos vectorAdd (AGLtoASL (_projectile vectorModelToWorld [0, 50, 0]));

// _shooter returns the vehicle that shot it. If the launcher dies, the wire would probably be cut so assume it
if ((_distanceToProjectile > _seekerMaxRangeSqr) || _wireCut || { !alive _shooter }) exitWith {
    // wire snap, random direction
    if (!_wireCut) then {
        _attackProfileStateParams set [1, true];
        playSound3D ["a3\sounds_f\air\sfx\SL_rope_break.wss", objNull, false, AGLtoASL (_shooter modelToWorld _wireCutSource), 5, 1, 25];
    };

    if (_serviceChargeCount > 0 && {(_lastTime - CBA_missionTime) <= 0}) then {
        _attackProfileStateParams set [5, CBA_missionTime + 0.05 + random 0.1];
        private _randomVector = [(random 2) - 1, random 1, (random 2) - 1];
        _projectile setVelocityModelSpace ((velocityModelSpace _projectile) vectorAdd (_randomVector vectorMultiply _serviceChargeAcceleration));
        private _charge = createVehicle [QGVAR(serviceCharge), [0, 0, 0], [], 0, "NONE"];
        _charge setPosASL (_projectilePos vectorAdd ((_randomVector vectorMultiply -1) vectorMultiply 0.025));
        _attackProfileStateParams set [7, _serviceChargeCount - 1];
    };

    _retPos
};

if (_distanceToProjectile <= _seekerMinRangeSqr || { _serviceChargeCount <= 0 } || { !(_shooter getVariable [QGVAR(sightAttached), true]) }) exitWith { _retPos };

// if the time between updates is less than the pop time we want to fire the rockets OR if the missile wants to make a major correction pop it rapidly
if (((_lastTime - CBA_missionTime) <= 0) || {(_lastTime - CBA_missionTime) < (_serviceInterval / 2) && (_projectilePos vectorDistance _seekerTargetPos > 1)}) then {
    _attackProfileStateParams set [5, CBA_missionTime + _serviceInterval];

    private _vectorToCrosshair = vectorNormalized (_projectile worldToModel (ASLToAGL _seekerTargetPos));
    private _vectorToPos = vectorNormalized (((_projectile vectorWorldToModelVisual (_shooter weaponDirection _weapon)) vectorMultiply (_dragonSpeed * _serviceInterval)) vectorAdd (_vectorToCrosshair vectorMultiply _maxCorrectableDistance));

    if ((_vectorToPos select 2) < 0) then {
        _vectorToPos set [2, 0];
    } else {
        private _a = _vectorToPos select 1;
        private _b = _vectorToPos select 2;
        // The booster has some angle to it, so we introduce that axis if the angle is too low
        if (abs(_a) > 0 && { abs(atan (_b / _a)) < DRAGON_BOOSTER_ANGLE }) then {
            _vectorToPos set [2, abs(_a)];
        };
    };

    _projectile setVelocityModelSpace ((velocityModelSpace _projectile) vectorAdd (_vectorToPos vectorMultiply _serviceChargeAcceleration));

    private _charge = createVehicle [QGVAR(serviceCharge), [0, 0, 0], [], 0, "NONE"];
    _charge setPosASL (_projectilePos vectorAdd ((_vectorToCrosshair vectorMultiply -1) vectorMultiply 0.025));

    _attackProfileStateParams set [7, _serviceChargeCount - 1];
};

_retPos

