#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Applies drag to a missile (based on ace_artillerytables_fnc_firedEH)
 *
 * Arguments:
 * 0: Projectile <OBJECT>
 * 1: Drag <NUMBER>
 * 2: Last time ran (modified via _this array) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [x, 2, 2] call ace_missile_clgp_fnc_submunition_applyDrag
 *
 * Public: No
 */

params ["_projectile", "_kFactor", "_time"];

private _deltaT = CBA_missionTime - _time;
_this set [2, CBA_missionTime];

if (_kFactor != 0) then {
    private _bulletVelocity = velocity _projectile;
    private _trueVelocity = _bulletVelocity vectorDiff wind;
    private _trueSpeed = vectorMagnitude _trueVelocity;

    private _drag = _deltaT * _kFactor * _trueSpeed;
    private _accel = _trueVelocity vectorMultiply _drag;
    _bulletVelocity = _bulletVelocity vectorAdd _accel;

    _projectile setVelocity _bulletVelocity;
};

