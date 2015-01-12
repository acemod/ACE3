/*
 * Author: commy2
 *
 * Adjust a projectiles velocity and dir + up vector.
 *
 * Argument:
 * 0: Projectile (Object, CfgAmmo)
 * 1: Adjust azimuth this much. (Number)
 * 2: Adjust inclination this much. (Number)
 * 3: Adjust projectile speed this much. In m/s. (Number, optional default: 0 m/s)
 *
 * Return value:
 * None.
 */

private ["_projectile", "_adjustDir", "_adjustUp", "_adjustSpeed", "_vdir", "_dir", "_up", "_l", "_r", "_vup", "_vel"];

_projectile = _this select 0;
_adjustDir = _this select 1;
_adjustUp = _this select 2;
_adjustSpeed = _this select 3;

if (isNil "_adjustSpeed") then {
  _adjustSpeed = 0;
};

["CPD", [_fnc_scriptNameParent, _adjustDir, _adjustUp, _adjustSpeed], nil, false] call AGM_Debug_fnc_log;

// get old direction vector
_vdir = vectorDir _projectile;

// get azimuth and inclination and apply corrections
_dir = (_vdir select 0) atan2 (_vdir select 1) + _adjustDir;
_up = sqrt ((_vdir select 1) ^ 2 + (_vdir select 0) ^ 2) atan2 - (_vdir select 2) + _adjustUp;

// get new direction vector (this is a unit vector)
_vdir = [
  sin _dir * sin _up,
  cos _dir * sin _up,
  - cos _up
];

// get best up vector
_l = sqrt ((_vdir select 0) ^ 2 + (_vdir select 1) ^ 2); if (_l == 0) then {diag_log text format ["[AGM] ERROR: %1, %2, %3, %4, %5, %6, %7", _projectile, _adjustDir, _adjustUp, vectorDir _projectile, _vdir, _dir, _up]};
_r = -(_vdir select 2) / _l;

_vup = [
  (_vdir select 0) * _r,
  (_vdir select 1) * _r,
  _l
];

// get new speed vector. Keep total speed, but change to new direction. Yay for vector commands.
_vel = _vdir vectorMultiply _adjustSpeed + vectorMagnitude velocity _projectile;

// set projectile direction dir and up. Projectiles are long objects, especially with tracers, so it would look dumb otherwise.
_projectile setVectorDirAndUp [_vdir, _vup];

// set new speed vector
_projectile setVelocity _vel;
