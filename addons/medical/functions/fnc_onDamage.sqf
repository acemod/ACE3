/**
 * fnc_onDamage.sqf
 * @Descr: Called when some dude gets shot. Or stabbed. Or blown up. Or pushed off a cliff. Or hit by a car. Or burnt. Or poisoned. Or gassed. Or cut. You get the idea.
 * @Author: KoffeinFlummi
 *
 * @Arguments: [unit OBJECT, selection STRING, damagE NUMBER, source OBJECT, projectile STRING (Could be an OBJECT on occasion)]
 * @Return: damage value to be inflicted
 * @PublicAPI: false
 */

#include "script_component.hpp"

#define ARMOURCOEF 2

private ["_unit", "_selectionName", "_damage", "_source", "_source", "_projectile", "_hitSelections", "_hitPoints", "_newDamage", "_found", "_cache_projectiles", "_cache_hitpoints", "_cache_damages"];
_unit          = _this select 0;
_selectionName = _this select 1;
_damage        = _this select 2;
_source        = _this select 3;
_projectile    = _this select 4;

if (!([_unit] call FUNC(hasMedicalEnabled))) exitwith {
    call FUNC(handleDamage); // let it run through the damage threshold script
};

// Otherwise we carry on with collecting the necessary information

if (typeName _projectile == "OBJECT") then {
  _projectile = typeOf _projectile;
};

// This seems to only show up in MP too, but since it doesn't
// collide with anything, I'll check it in SP as well.
if (_selectionName == "r_femur_hit") then {
    _selectionName = "leg_r";
};

// If the damage is being weird, we just tell it to fuck off.
if !(_selectionName in ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"]) exitWith {0.01};

// Cache the handleDamage call
[_unit, _selectionName, _damage, _source, _projectile] call FUNC(cacheHandledamageCall);

// Check if a unit would die from this hit
if (alive (vehicle _unit)) then {
    _bodyPartn = [_selectionName] call FUNC(getBodyPartNumber);

    // Find the correct Damage threshold for unit.
    _damageThreshold = [1,1,1];
    if (isPlayer _unit) then {
        _damageThreshold =_unit getvariable[QGVAR(unitDamageThreshold), [GVAR(damageThreshold_Players), GVAR(damageThreshold_Players), GVAR(damageThreshold_Players) * 1.7]];
    } else {
        _damageThreshold =_unit getvariable[QGVAR(unitDamageThreshold), [GVAR(damageThreshold_AI), GVAR(damageThreshold_AI), GVAR(damageThreshold_AI) * 1.7]];
    };
    _damageBodyPart = ([_unit,QGVAR(bodyPartStatus),[0,0,0,0,0,0]] call EFUNC(common,getDefinedVariable)) select _bodyPartn;

    _hitSelections = ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"];
    _hitPoints = ["HitHead", "HitBody", "HitLeftArm", "HitRightArm", "HitLeftLeg", "HitRightLeg"];

    // Calculate change in damage.
    _previousDamage = _unit getvariable [QGVAR(bodyPartStatusPrevious), [0,0,0,0,0,0]];
    _newDamage = _damage - (_previousDamage select _bodyPartn);

      // Check if damage to body part is higher as damage head
    if (_bodyPartn == 0) exitwith {
       if (_damageBodyPart >= ((_damageThreshold select 0) + _newDamage) && {(random(1) > 0.2)}) then {
           _damage = 1;
       };
    };

    // Check if damage to body part is higher as damage torso
    if (_bodyPartn == 1) exitwith {
        if (_damageBodyPart >= ((_damageThreshold select 1) + _newDamage) && {(random(1) > 0.2)}) then {
            _damage = 1;
        };
    };
    // Check if damage to body part is higher as damage limbs
    if (_damageBodyPart >= ((_damageThreshold select 2) + _newDamage) && {(random(1) > 0.95)}) exitwith {
        _damage = 1;
    };
     // Checking if we should return full damage or not
    if (_damage > 0.975) then {
        _damage = 0.975;
    };
} else {
    _damage = 1;
};
_damage
