#include "script_component.hpp"
/*
 * Author: commy2 and esteldunedain
 * Calculate and apply backblast damage to potentially affected local units
 * Handles the "overpressure" event.
 *
 * Arguments:
 * 0: Unit that fired <OBJECT>
 * 1: Pos ASL of the projectile <ARRAY>
 * 2: Direction of the projectile (reversed for launcher backblast) <ARRAY>
 * 3: Weapon fired <STRING>
 * 4: Magazine <STRING>
 * 5: Ammo <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [tank, [1727.57,5786.15,7.24899], [-0.982474,-0.185998,-0.0122501], "cannon_125mm", "24Rnd_125mm_APFSDS_T_Green", "Sh_125mm_APFSDS_T_Green"] call ace_overpressure_fnc_overpressureDamage
 *
 * Public: No
 */

params ["_firer", "_posASL", "_direction", "_weapon", "_magazine", "_ammo"];

// Bake variable name and check if the variable exists, call the caching function otherwise
private _varName = format [QGVAR(values%1%2%3), _weapon, _ammo, _magazine];
private _var = if (isNil _varName) then {
    [_weapon, _ammo, _magazine] call FUNC(cacheOverPressureValues);
} else {
    missionNameSpace getVariable _varName;
};
_var params ["_overpressureAngle","_overpressureRange","_overpressureDamage"];
TRACE_3("cache",_overpressureAngle,_overpressureRange,_overpressureDamage);

{
    if (local _x && {_x != _firer} && {vehicle _x == _x}) then {
        private _targetPositionASL = eyePos _x;
        private _relativePosition = _targetPositionASL vectorDiff _posASL;
        private _axisDistance = _relativePosition vectorDotProduct _direction;
        private _distance = vectorMagnitude _relativePosition;
        private _angle = acos (_axisDistance / _distance);

        private _line = [_posASL, _targetPositionASL, _firer, _x];
        private _line2 = [_posASL, _targetPositionASL];
        TRACE_4("Affected:",_x,_axisDistance,_distance,_angle);

        if (_angle < _overpressureAngle && {_distance < _overpressureRange} && {!lineIntersects _line} && {!terrainIntersectASL _line2}) then {

            private _alpha = sqrt (1 - _distance / _overpressureRange);
            private _beta = sqrt (1 - _angle / _overpressureAngle);

            private _damage = _alpha * _beta * _overpressureDamage;
            TRACE_1("",_damage);

            // If the target is the ACE_player
            if (_x == ACE_player) then {[_damage * 100] call BIS_fnc_bloodEffect};

            TRACE_1("",isDamageAllowed _x);
            if (isDamageAllowed _x && {_x getVariable [QEGVAR(medical,allowDamage), true]}) then {
                if (isClass (configFile >> "CfgPatches" >> "ACE_Medical")) then {
                    [_x, _damage, "body", "backblast", _firer] call EFUNC(medical,addDamageToUnit);
                } else {
                    _x setDamage (damage _x + _damage);
                };
            };

            #ifdef DEBUG_MODE_FULL
            //Shows damage lines in green
            [   _posASL,
            _targetPositionASL,
            [0,1,0,1]
            ] call EFUNC(common,addLineToDebugDraw);
            #endif
        };
    };
} forEach ((ASLtoAGL _posASL) nearEntities ["CAManBase", _overpressureRange]);
