/*
 * Author: joko // Jonas
 * Handle fire of local launchers. Called from the unified fired EH only for the local player.
 *
 * Arguments:
 * None. Parameters inherited from EFUNC(common,firedEH)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "launch_RPG32_F", "launch_RPG32_F", "Single", "R_PG32V_F", "RPG32_F", projectile] call ace_overpressure_fnc_firedEHBB;
 *
 * Public: No
 */
#include "script_component.hpp"

//IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle", "_gunner", "_turret"];
TRACE_10("firedEH:",_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile, _vehicle, _gunner, _turret);

// Bake variable name and check if the variable exists, call the caching function otherwise
private _varName = format [QGVAR(values%1%2%3), _weapon, _ammo, _magazine];
private _var = if (isNil _varName) then {
    [_weapon, _ammo, _magazine] call FUNC(cacheOverPressureValues);
} else {
    missionNameSpace getVariable _varName;
};
_var params ["_backblastAngle","_backblastRange","_backblastDamage"];
TRACE_3("cache",_backblastAngle,_backblastRange,_backblastDamage);

if (_backblastDamage <= 0) exitWith {};

private _position = getPosASL _projectile;
private _direction = [0, 0, 0] vectorDiff (vectorDir _projectile);

// Damage to others
private _affected = (ASLtoAGL _position) nearEntities ["CAManBase", _backblastRange];

// Let each client handle their own affected units
["ace_overpressure", [_unit, _position, _direction, _weapon, _magazine, _ammo], _affected] call CBA_fnc_targetEvent;

// Damage to the firer
private _distance = 2 * ([_position, _direction, _backblastRange, _unit] call FUNC(getDistance));

TRACE_1("Distance",_distance);

if (_distance < _backblastRange) then {
    private _alpha = sqrt (1 - _distance / _backblastRange);
    private _beta = sqrt 0.5;

    private _damage = _alpha * _beta * _backblastDamage;
    [_damage * 100] call BIS_fnc_bloodEffect;

    if (isClass (configFile >> "CfgPatches" >> "ACE_Medical") && {([_unit] call EFUNC(medical,hasMedicalEnabled))}) then {
        [_unit, _damage, "body", "backblast"] call EFUNC(medical,addDamageToUnit);
    } else {
        TRACE_1("",isDamageAllowed _unit);
        if (!isDamageAllowed _unit) exitWith {}; // Skip damage if not allowed
        _unit setDamage (damage _unit + _damage);
    };
};

// Draw debug lines
#ifdef DEBUG_MODE_FULL
    [   _position,
        _position vectorAdd (_direction vectorMultiply _backblastRange),
        [1,1,0,1]
    ] call EFUNC(common,addLineToDebugDraw);

    private _ref = _direction call EFUNC(common,createOrthonormalReference);
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
        _position vectorAdd (_direction vectorMultiply ((_distance/2) min _backblastRange)),
        [1,0,0,1]
    ] call EFUNC(common,addLineToDebugDraw);
#endif
