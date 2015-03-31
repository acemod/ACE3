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

private ["_unit", "_selection", "_damage", "_shooter", "_projectile", "_damageReturn"];

_unit         = _this select 0;
_selection    = _this select 1;
_damage       = _this select 2;
_shooter      = _this select 3;
_projectile   = _this select 4;
_damageReturn = _this select 5;


// This is a new hit, reset variables.
// Note: sometimes handleDamage spans over 2 or even 3 frames.
if (diag_frameno > (_unit getVariable [QGVAR(frameNo), -3]) + 2) then {
    _unit setVariable [QGVAR(frameNo), diag_frameno];
    _unit setVariable [QGVAR(isFalling), false];
    _unit setVariable [QGVAR(projectiles), []];
    _unit setVariable [QGVAR(hitPoints), []];
    _unit setVariable [QGVAR(damages), []];
    _unit setVariable [QGVAR(structDamage), 0];
    _unit setVariable [QGVAR(preventDeath), false];
};


_hitSelections = ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"];
_hitPoints = ["HitHead", "HitBody", "HitLeftArm", "HitRightArm", "HitLeftLeg", "HitRightLeg"];

_newDamage = _damageReturn - (damage _unit);
if (_selection in _hitSelections) then {
    _newDamage = _damageReturn - (_unit getHitPointDamage (_hitPoints select (_hitSelections find _selection)));
};

_damageReturn = _damageReturn - _newDamage;


// Exclude falling damage to everything other than legs and reduce it overall.
if (((velocity _unit) select 2 < -5) and (vehicle _unit == _unit)) then {
    _unit setVariable [QGVAR(isFalling), true];
};
if (_unit getVariable [QGVAR(isFalling), false] and !(_selectionName in ["", "leg_l", "leg_r"])) exitWith {
    (_unit getHitPointDamage (_hitPoints select (_hitSelections find _selectionName))) max 0.01;
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
            _cache_hitpoints pushBack (_hitPoints select (_hitSelections find _selectionName));
            _cache_damages pushBack _newDamage;
        };
    } else {
        _cache_projectiles pushBack _projectile;
        _cache_hitpoints pushBack (_hitPoints select (_hitSelections find _selectionName));
        _cache_damages pushBack _newDamage;
    };
    _unit setVariable [QGVAR(projectiles), _cache_projectiles];
    _unit setVariable [QGVAR(hitPoints), _cache_hitpoints];
    _unit setVariable [QGVAR(damages), _cache_damages];
};

// Get rid of double structural damage (seriously arma, what the fuck?)
if (_selection == "") then {
    _cache_structDamage = _unit getVariable QGVAR(structDamage);
    if (_newDamage > _cache_structDamage) then {
        _unit setVariable [QGVAR(structDamage), _newDamage];
        _newDamage = _newDamage - _cache_structDamage;
    } else {
        _newDamage = 0;
    };
};


// Assign orphan structural damage to torso
[{
    private ["_unit", "_damagesum"];
    _unit = _this select 0;
    _damagesum = (_unit getHitPointDamage "HitHead") +
        (_unit getHitPointDamage "HitBody") +
        (_unit getHitPointDamage "HitLeftArm") +
        (_unit getHitPointDamage "HitRightArm") +
        (_unit getHitPointDamage "HitLeftLeg") +
        (_unit getHitPointDamage "HitRightLeg");
    if (_damagesum < 0.06 and damage _unit > 0.06 and alive _unit) then {
        _unit setHitPointDamage ["HitBody", damage _unit];
    };
}, [_unit], 2, 0.1] call EFUNC(common,waitAndExecute);


if (_selection == "") then {
    _damageReturn = _damageReturn + (_unit getVariable QGVAR(structDamage));
} else {
    _damageReturn = _damageReturn + _newDamage;
};


// Leg Damage
_legdamage = (_unit getHitPointDamage "HitLeftLeg") + (_unit getHitPointDamage "HitRightLeg");
if (_selectionName == "leg_l") then {
    _legdamage = _damageReturn + (_unit getHitPointDamage "HitRightLeg");
};
if (_selectionName == "leg_r") then {
    _legdamage = (_unit getHitPointDamage "HitLeftLeg") + _damageReturn;
};

if (_legdamage >= LEGDAMAGETRESHOLD1) then {
    if (_unit getHitPointDamage "HitLegs" != 1) then {_unit setHitPointDamage ["HitLegs", 1]};
} else {
    if (_unit getHitPointDamage "HitLegs" != 0) then {_unit setHitPointDamage ["HitLegs", 0]};
};
// @todo: force prone for completely fucked up legs.


// Arm Damage
_armdamage = (_unit getHitPointDamage "HitLeftArm") + (_unit getHitPointDamage "HitRightArm");
if (_selectionName == "hand_l") then {
    _armdamage = _damageReturn + (_unit getHitPointDamage "HitRightArm");
};
if (_selectionName == "hand_r") then {
    _armdamage = (_unit getHitPointDamage "HitLeftArm") + _damageReturn;
};

if (_armdamage >= ARMDAMAGETRESHOLD1) then {
    if (_unit getHitPointDamage "HitHands" != 1) then {_unit setHitPointDamage ["HitHands", 1]};
} else {
    if (_unit getHitPointDamage "HitHands" != 0) then {_unit setHitPointDamage ["HitHands", 0]};
};
// @todo: Drop weapon for full damage.


// Set Pain
if (_selection == "") then {
    _pain = _unit getVariable [QGVAR(pain), 0];
    _pain = _pain + _newDamage * (1 - (_unit getVariable [QGVAR(morphine), 0]));
    _unit setVariable [QGVAR(pain), _pain min 1, true];
};


// Unconsciousness
if (_selection == "" and
    _damageReturn >= UNCONSCIOUSNESSTRESHOLD and
    _damageReturn < 1 and
    !(_unit getVariable ["ACE_isUnconscious", False]
)) then {
    if (_unit getVariable [QGVAR(allowUnconscious), ([_unit] call EFUNC(common,isPlayer)) or random 1 > 0.3]) then {
        [_unit, true] call FUNC(setUnconscious);
    } else {
        _damageReturn = 1;
    };
};

_damageReturn
