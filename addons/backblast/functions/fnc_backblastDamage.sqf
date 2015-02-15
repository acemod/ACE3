/*
 * Author: Commy2 and CAA-Picard
 *
 * Calculate and apply backblast damage to potentially affected local units
 *
 * Argument:
 * 0: Unit that fired (Object)
 * 1: Pos ASL of the projectile (Array)
 * 2: Direction of the projectile (Array)
 * 3: Weapon fired (String)
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

EXPLODE_4_PVT(_this,_firer,_posASL,_direction,_weapon);

private ["_backblastAngle","_backblastRange","_backblastDamage"];
_backblastAngle = getNumber (configFile >> "CfgWeapons" >> _weapon >> "ACE_Backblast_Angle") / 2;
_backblastRange = getNumber (configFile >> "CfgWeapons" >> _weapon >> "ACE_Backblast_Range");
_backblastDamage = getNumber (configFile >> "CfgWeapons" >> _weapon >> "ACE_Backblast_Damage");
TRACE_4("Parameters:",_backblastAngle,_backblastRange,_backblastDamage,_weapon);

_pos = _posASL;
if (!surfaceIsWater _pos) then {
    _pos = ASLtoATL _pos;
};

_affected = _pos nearEntities ["CAManBase", _backblastRange];
{
    _unit = _x;
    if (local _unit && _unit != _firer && vehicle _unit == _unit) then {

        _targetPositionASL = eyePos _unit;
        _relativePosition = _targetPositionASL vectorDiff _posASL;
        _axisDistance = _relativePosition vectorDotProduct _direction;
        _distance = vectorMagnitude _relativePosition;
        _angle = acos (_axisDistance / _distance);

        _line = [_posASL, _targetPositionASL, _firer, _unit];
        _line2 = [_posASL, _targetPositionASL];
        TRACE_4("Affected:",_unit,_axisDistance,_distance,_angle);
        if (_angle < _backblastAngle && {_distance < _backblastRange} && {!lineIntersects _line} && {!terrainIntersectASL _line2}) then {
            _alpha = sqrt (1 - _distance / _backblastRange);
            _beta = sqrt (1 - _angle / _backblastAngle);

            _damage = 2 * _alpha * _beta * _backblastDamage;

            // If the target is the ACE_player
            if (_unit == ACE_player) then {[_damage * 100] call BIS_fnc_bloodEffect};

            // TODO: Sort this interaction with medical
            if (isClass (configFile >> "CfgPatches" >> "ACE_Medical")) then {
                [_unit, "HitBody", ([_unit, "", ((_unit getHitPointDamage "HitBody") + _damage), objNull, objNull] call EFUNC(medical,handleDamage))] call EFUNC(medical,setHitPointDamage);
                _unit spawn {
                    sleep 0.5;
                    [_this, "", 0, objNull, objNull] call EFUNC(medical,handleDamage);
                };
            } else {
                _unit setDamage (damage _unit + _damage);
            };
        };
    };
} forEach _affected;


