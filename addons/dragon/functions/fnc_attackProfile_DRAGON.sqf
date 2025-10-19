#include "..\script_component.hpp"
#define GRAVITY_OFFSET [0, 0, _serviceInterval^2 * 4.9025]
/*
 * Author: tcvm (Code inspired by NouberNou's Dragon Guidance)
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
private _retPos = _projectilePos vectorAdd (AGLToASL (_projectile vectorModelToWorld [0, 50, 0]));

// _shooter returns the vehicle that shot it. If the launcher dies, the wire would probably be cut so assume it
if ((_distanceToProjectile > _seekerMaxRangeSqr) || _wireCut || { !alive _shooter }) exitWith {
    // wire snap, random direction
    if (!_wireCut) then {
        _attackProfileStateParams set [1, true];
        playSound3D ["a3\sounds_f\air\sfx\SL_rope_break.wss", objNull, false, _shooter modelToWorldWorld _wireCutSource, 5, 1, 25];
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

    private _vectorToCrosshair = vectorNormalized (_projectile worldToModel (GRAVITY_OFFSET vectorAdd ASLToAGL _seekerTargetPos));
    // Plus or minus since we'll assume the change a charge is at the exact vector is pseudo random
    private _angle = ((_vectorToCrosshair#2) atan2 (_vectorToCrosshair#0)) - 22.5 + random 45;

    _projectile setVelocityModelSpace ((velocityModelSpace _projectile) vectorAdd ([cos _angle * sin DRAGON_BOOSTER_ANGLE, cos DRAGON_BOOSTER_ANGLE , sin _angle * sin DRAGON_BOOSTER_ANGLE] vectorMultiply _serviceChargeAcceleration));
    private _charge = createVehicle [QGVAR(serviceCharge), [0, 0, 0], [], 0, "NONE"];
    _charge setPosASL (_projectilePos vectorAdd (_vectorToCrosshair vectorMultiply -0.025));
    [QEGVAR(common,setShotParents), [_charge] + getShotParents _projectile] call CBA_fnc_serverEvent; // AI should be alerted of popping source

    _attackProfileStateParams set [7, _serviceChargeCount - 1];
};

_retPos
