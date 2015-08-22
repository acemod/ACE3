/*
 * Author: KoffeinFlummi
 * Basic HandleDamage EH function.
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Name Of Hit Selection <STRING>
 * 2: Amount Of Damage <NUMBER>
 * 3: Shooter <OBJECT>
 * 4: Projectile <STRING>
 * 5: Current damage to be returned <NUMBER>
 *
 * Return Value:
 * Damage To Be Inflicted <NUMBER>
 *
 * Public: No
 */

#include "script_component.hpp"

#define LEGDAMAGETRESHOLD1 1
#define LEGDAMAGETRESHOLD2 1.7
#define ARMDAMAGETRESHOLD1 1
#define ARMDAMAGETRESHOLD2 1.7
#define UNCONSCIOUSNESSTRESHOLD 0.7

private ["_damage", "_armdamage", "_hitPoint", "_index", "_legdamage", "_newDamage", "_otherDamage", "_pain", "_restore"];
params ["_unit", "_selectionName", "_damage", "_shooter", "_projectile"];

// Apply damage treshold / coefficient
_threshold = [
    _unit getVariable [QGVAR(damageThreshold), GVAR(AIDamageThreshold)],
    _unit getVariable [QGVAR(damageThreshold), GVAR(playerDamageThreshold)]
] select ([_unit] call EFUNC(common,isPlayer));
_damage = _damage * (1 / _threshold);

// This is a new hit, reset variables.
// Note: sometimes handleDamage spans over 2 or even 3 frames.
if (diag_frameno > (_unit getVariable [QGVAR(basic_frameNo), -3]) + 2) then {
    _unit setVariable [QGVAR(basic_frameNo), diag_frameno];
    _unit setVariable [QGVAR(isFalling), false];
    _unit setVariable [QGVAR(projectiles), []];
    _unit setVariable [QGVAR(hitPoints), []];
    _unit setVariable [QGVAR(damages), []];
    _unit setVariable [QGVAR(structDamage), 0];

    if (isnil {_unit getvariable QGVAR(structDamagePFH)}) then {
    // Assign orphan structural damage to torso
        [{
            private "_damagesum";
            params ["_args", "_idPFH"];
            _args params ["_unit"];

            if (ACE_diagTime - (_unit getvariable [QGVAR(structDamagePFH),-2]) >= 2) then {
                 _unit setVariable [QGVAR(structDamagePFH), nil];
                _damagesum = (_unit getHitPointDamage "HitHead") +
                    (_unit getHitPointDamage "HitBody") +
                    (_unit getHitPointDamage "HitLeftArm") +
                    (_unit getHitPointDamage "HitRightArm") +
                    (_unit getHitPointDamage "HitLeftLeg") +
                    (_unit getHitPointDamage "HitRightLeg");
                if (_damagesum < 0.06 and damage _unit > 0.06 and alive _unit) then {
                    _unit setHitPointDamage ["HitBody", damage _unit];
                };
                [_idPFH] call CBA_fnc_removePerFrameHandler;
            };
        }, 0, [_unit]] call CBA_fnc_addPerFrameHandler;
    };
    _unit setVariable [QGVAR(structDamagePFH), ACE_diagTime]; // Assign starting ACE_time or reset it
};

_newDamage = _damage - (damage _unit);
if (_selectionName in GVAR(SELECTIONS)) then {
    _newDamage = _damage - (_unit getHitPointDamage (GVAR(HITPOINTS) select (GVAR(SELECTIONS) find _selectionName)));
};

_damage = _damage - _newDamage;


// Exclude falling damage to everything other than legs and reduce it overall.
if (((velocity _unit) select 2 < -5) and (vehicle _unit == _unit)) then {
    _unit setVariable [QGVAR(isFalling), true];
};
if (_unit getVariable [QGVAR(isFalling), false] and !(_selectionName in ["", "leg_l", "leg_r"])) exitWith {
    (_unit getHitPointDamage (GVAR(HITPOINTS) select (GVAR(SELECTIONS) find _selectionName))) max 0.01;
};
if (_unit getVariable [QGVAR(isFalling), false]) then {
    _newDamage = _newDamage * 0.7;
};


// Make sure there's only one damaged selection per projectile per frame.
if (_selectionName != "" and !(_unit getVariable QGVAR(isFalling))) then {
    _cache_projectiles = _unit getVariable QGVAR(projectiles);
    _cache_hitpoints = _unit getVariable QGVAR(hitPoints);
    _cache_damages = _unit getVariable QGVAR(damages);
    if (_projectile in _cache_projectiles) then {
        _index = _cache_projectiles find _projectile;
        _otherDamage = (_cache_damages select _index);
        if (_otherDamage > _newDamage) then {
            _newDamage = 0;
        } else {
            _hitPoint = _cache_hitpoints select _index;
            _restore = ((_unit getHitPointDamage _hitPoint) - _otherDamage) max 0;
            _unit setHitPointDamage [_hitPoint, _restore];
            // Make entry unfindable
            _cache_projectiles set [_index, objNull];
            _cache_projectiles pushBack _projectile;
            _cache_hitpoints pushBack (GVAR(HITPOINTS) select (GVAR(SELECTIONS) find _selectionName));
            _cache_damages pushBack _newDamage;
        };
    } else {
        _cache_projectiles pushBack _projectile;
        _cache_hitpoints pushBack (GVAR(HITPOINTS) select (GVAR(SELECTIONS) find _selectionName));
        _cache_damages pushBack _newDamage;
    };
    _unit setVariable [QGVAR(projectiles), _cache_projectiles];
    _unit setVariable [QGVAR(hitPoints), _cache_hitpoints];
    _unit setVariable [QGVAR(damages), _cache_damages];
};

// Get rid of double structural damage (seriously arma, what the fuck?)
if (_selectionName == "") then {
    _cache_structDamage = _unit getVariable QGVAR(structDamage);
    if (_newDamage > _cache_structDamage) then {
        _unit setVariable [QGVAR(structDamage), _newDamage];
        _newDamage = _newDamage - _cache_structDamage;
    } else {
        _newDamage = 0;
    };
};

if (_selectionName == "") then {
    _damage = _damage + (_unit getVariable QGVAR(structDamage));
} else {
    _damage = _damage + _newDamage;
};

// Leg Damage
_legdamage = (_unit getHitPointDamage "HitLeftLeg") + (_unit getHitPointDamage "HitRightLeg");
if (_selectionName == "leg_l") then {
    _legdamage = _damage + (_unit getHitPointDamage "HitRightLeg");
};
if (_selectionName == "leg_r") then {
    _legdamage = (_unit getHitPointDamage "HitLeftLeg") + _damage;
};

if (_legdamage >= LEGDAMAGETRESHOLD1) then {
    _unit setHitPointDamage ["HitLegs", 1];
} else {
    _unit setHitPointDamage ["HitLegs", 0];
};
// @todo: force prone for completely fucked up legs.


// Arm Damage
_armdamage = (_unit getHitPointDamage "HitLeftArm") + (_unit getHitPointDamage "HitRightArm");
if (_selectionName == "hand_l") then {
    _armdamage = _damage + (_unit getHitPointDamage "HitRightArm");
};
if (_selectionName == "hand_r") then {
    _armdamage = (_unit getHitPointDamage "HitLeftArm") + _damage;
};

if (_armdamage >= ARMDAMAGETRESHOLD1) then {
    _unit setHitPointDamage ["HitHands", 1];
} else {
    _unit setHitPointDamage ["HitHands", 0];
};
// @todo: Drop weapon for full damage.


// Set Pain
if (_selectionName == "") then {
    _pain = _unit getVariable [QGVAR(pain), 0];
    _pain = _pain + _newDamage * (1 - (_unit getVariable [QGVAR(morphine), 0]));
    _unit setVariable [QGVAR(pain), _pain min 1, true];
};

// Unconsciousness
if (_selectionName == "" and
    _damage >= UNCONSCIOUSNESSTRESHOLD and
    _damage < 1 and
    !(_unit getVariable ["ACE_isUnconscious", False]
)) then {
    [_unit, true] call FUNC(setUnconscious);
};

_damage
