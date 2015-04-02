/*
 * Author: commy2 and esteldunedain
 *
 * Handle fire of local launchers
 *
 * Argument:
 * 0: Unit that fired (Object)
 * 1: Weapon fired (String)
 * 2: Muzzle (String)
 * 3: Mode (String)
 * 4: Ammo (String)
 * 5: Magazine (String)
 * 6: Projectile (Object)
 *
 * Return value:
 * None
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

EXPLODE_7_PVT(_this,_firer,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);

// Prevent AI from causing backblast damage
if !([_firer] call EFUNC(common,isPlayer)) exitWith {};

private ["_position", "_direction"];

_position = getPosASL _projectile;
_direction = [0, 0, 0] vectorDiff (vectorDir _projectile);

private ["_backblastAngle", "_backblastRange", "_backblastDamage"];

_backblastAngle = getNumber (configFile >> "CfgWeapons" >> _weapon >> QGVAR(angle)) / 2;
_backblastRange = getNumber (configFile >> "CfgWeapons" >> _weapon >> QGVAR(range));
_backblastDamage = getNumber (configFile >> "CfgWeapons" >> _weapon >> QGVAR(damage));

// Damage to others
private "_affected";
_affected = getPos _projectile nearEntities ["CAManBase", _backblastRange];

// Let each client handle their own affected units
["overpressure", _affected, [_firer, _position, _direction, _weapon]] call EFUNC(common,targetEvent);

// Damage to the firer
private "_distance";
_distance = [_position, _direction, _backblastRange] call FUNC(getDistance);

TRACE_1("Distance",_distance);

if (_distance < _backblastRange) then {
    private ["_alpha", "_beta", "_damage"];

    _alpha = sqrt (1 - _distance / _backblastRange);
    _beta = sqrt 0.5;

    _damage = _alpha * _beta * _backblastDamage;
    [_damage * 100] call BIS_fnc_bloodEffect;

    if (isClass (configFile >> "CfgPatches" >> "ACE_Medical") && {([_firer] call EFUNC(medical,hasMedicalEnabled))}) then {
         [_firer, "HitBody", [_firer, "body", ((_firer getHitPointDamage "HitBody") + _damage), _firer, "backblast"] call EFUNC(medical,handleDamage)] call EFUNC(medical,setHitPointDamage);
    } else {
        _firer setDamage (damage _firer + _damage);
    };
};

// Draw debug lines
#ifdef DEBUG_MODE_FULL
    [   _position,
        _position vectorAdd (_direction vectorMultiply _backblastRange),
        [1,1,0,1]
    ] call EFUNC(common,addLineToDebugDraw);

    private "_ref";
    _ref = _direction call EFUNC(common,createOrthonormalReference);
    [   _position,
        _position vectorAdd (_direction vectorMultiply _backblastRange) vectorAdd ((_ref select 1) vectorMultiply _backblastRange * tan _backblastAngle),
        [1,1,0,1]
    ] call EFUNC(common,addLineToDebugDraw);
    [   _position,
        _position vectorAdd (_direction vectorMultiply _backblastRange) vectorDiff ((_ref select 1) vectorMultiply _backblastRange * tan _backblastAngle),
        [1,1,0,1]
    ] call EFUNC(common,addLineToDebugDraw);
    [   _position,
        _position vectorAdd (_direction vectorMultiply _backblastRange) vectorAdd ((_ref select 2) vectorMultiply _backblastRange * tan _backblastAngle),
        [1,1,0,1]
    ] call EFUNC(common,addLineToDebugDraw);
    [   _position,
        _position vectorAdd (_direction vectorMultiply _backblastRange) vectorDiff ((_ref select 2) vectorMultiply _backblastRange * tan _backblastAngle),
        [1,1,0,1]
    ] call EFUNC(common,addLineToDebugDraw);

    [   _position,
        _position vectorAdd (_direction vectorMultiply (_distance min _backblastRange)),
        [1,0,0,1]
    ] call EFUNC(common,addLineToDebugDraw);
#endif
