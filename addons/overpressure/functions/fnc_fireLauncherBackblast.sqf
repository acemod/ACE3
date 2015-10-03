/*
 * Author: commy2 and esteldunedain
 *
 * Handle fire of local launchers
 *
 * Arguments:
 * 0: Unit that fired <OBJECT>
 * 1: Weapon fired <STRING>
 * 2: Muzzle <STRING>
 * 3: Mode <STRING>
 * 4: Ammo <STRING>
 * 5: Magazine <STRING>
 * 6: Projectile <OBJECT>
 *
 * Return value:
 * None
 */

#include "script_component.hpp"

params ["_firer", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];

// Prevent AI from causing backblast damage
if !([_firer] call EFUNC(common,isPlayer)) exitWith {};

private ["_position", "_direction"];

_position = getPosASL _projectile;
_direction = [0, 0, 0] vectorDiff (vectorDir _projectile);

private ["_var","_varName","_backblastAngle", "_backblastRange", "_backblastDamage"];
// Bake variable name and check if the variable exists, call the caching function otherwise
_varName = format [QGVAR(values%1%2%3), _weapon, _ammo, _magazine];
_var = if (isNil _varName) then {
    [_weapon, _ammo, _magazine] call FUNC(cacheOverPressureValues);
} else {
    missionNameSpace getVariable _varName;
};
_var params["_backblastAngle","_backblastRange","_backblastDamage"];


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
         [_firer, "body", ((_firer getVariable [QEGVAR(medical,bodyPartStatus), [0,0,0,0,0,0]]) select 1) + _damage, _firer, "backblast", 0] call EFUNC(medical,handleDamage);
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
