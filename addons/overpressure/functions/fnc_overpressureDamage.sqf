/*
 * Author: commy2 and esteldunedain
 *
 * Calculate and apply backblast damage to potentially affected local units
 *
 * Argument:
 * 0: Unit that fired <OBJECT>
 * 1: Pos ASL of the projectile <ARRAY>
 * 2: Direction of the projectile <ARRAY>
 * 3: Weapon fired <STRING>
 * 4: Magazine <STRING>
 * 5: Ammo <STRING>
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

private ["_var","_overpressureAngle", "_overpressureRange", "_overpressureDamage"];
params ["_firer", "_posASL", "_direction", "_weapon", "_magazine", "_ammo"];

// Bake variable name and check if the variable exists, call the caching function otherwise
_varName = format [QGVAR(values%1%2%3), _weapon, _ammo, _magazine];
_var = if (isNil _varName) then {
    [_weapon, _ammo, _magazine] call FUNC(cacheOverPressureValues);
} else {
    missionNameSpace getVariable _varName;
};
_var params["_overpressureAngle","_overpressureRange","_overpressureDamage"];

TRACE_4("Parameters:",_overpressureAngle,_overpressureRange,_overpressureDamage,_weapon);

private "_pos";
_pos = _posASL;
if (!surfaceIsWater _pos) then {
    _pos = ASLtoATL _pos;
};

{
    if (local _x && {_x != _firer} && {vehicle _x == _x}) then {
        private ["_targetPositionASL", "_relativePosition", "_axisDistance", "_distance", "_angle", "_line", "_line2"];

        _targetPositionASL = eyePos _x;
        _relativePosition = _targetPositionASL vectorDiff _posASL;
        _axisDistance = _relativePosition vectorDotProduct _direction;
        _distance = vectorMagnitude _relativePosition;
        _angle = acos (_axisDistance / _distance);

        _line = [_posASL, _targetPositionASL, _firer, _x];
        _line2 = [_posASL, _targetPositionASL];
        TRACE_4("Affected:",_x,_axisDistance,_distance,_angle);

        if (_angle < _overpressureAngle && {_distance < _overpressureRange} && {!lineIntersects _line} && {!terrainIntersectASL _line2}) then {
            private ["_alpha", "_beta", "_damage"];

            _alpha = sqrt (1 - _distance / _overpressureRange);
            _beta = sqrt (1 - _angle / _overpressureAngle);

            _damage = _alpha * _beta * _overpressureDamage;

            // If the target is the ACE_player
            if (_x == ACE_player) then {[_damage * 100] call BIS_fnc_bloodEffect};

            if (isClass (configFile >> "CfgPatches" >> "ACE_Medical") && {([_x] call EFUNC(medical,hasMedicalEnabled))}) then {
                [_x, "body", ((_x getVariable [QEGVAR(medical,bodyPartStatus), [0,0,0,0,0,0]]) select 1) + _damage, _firer, "backblast", 0] call EFUNC(medical,handleDamage);
            } else {
                _x setDamage (damage _x + _damage);
            };
        };
    };
} forEach (_pos nearEntities ["CAManBase", _overpressureRange]);
