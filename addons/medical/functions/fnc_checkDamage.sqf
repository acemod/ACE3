/*
 * Author: KoffeinFlummi
 *
 * Checks the unit for leg and arm damage, and removes orphan structural damage.
 *
 * Arguments:
 + 0: Unit
 * 1: Leg Damage
 * 2: Arm Damage
 * 3: Remove orphan damage? (Bool; optional, default No)
 *
 * Return Value:
 * None
 */

#define LEGDAMAGETRESHOLD1 1
#define LEGDAMAGETRESHOLD2 1.7
#define ARMDAMAGETRESHOLD1 1
#define ARMDAMAGETRESHOLD2 1.7

private ["_unit", "_legdamage", "_armdamage", "_damagesum"];

_unit = _this select 0;
_legdamage = _this select 1;
_armdamage = _this select 2;

// Leg Damage
// lightly wounded, only limit walking speed (forceWalk is for suckers)
if (_legdamage >= LEGDAMAGETRESHOLD1) then {
  if (_unit getHitPointDamage "HitLegs" != 1) then {_unit setHitPointDamage ["HitLegs", 1]};
} else {
  if (_unit getHitPointDamage "HitLegs" != 0) then {_unit setHitPointDamage ["HitLegs", 0]};
};
// @ŧodo: force prone for completely fucked up legs.

// Arm Damage
// fx only
if (_armdamage >= ARMDAMAGETRESHOLD1) then {
  if (_unit getHitPointDamage "HitHands" != 1) then {_unit setHitPointDamage ["HitHands", 1]};
} else {
  if (_unit getHitPointDamage "HitHands" != 0) then {_unit setHitPointDamage ["HitHands", 0]};
};

// remove leftover structural damage if unit is already fully healed
if (count _this > 3 and _this select 3) then {
  _damagesum = (_unit getHitPointDamage "HitHead") +
    (_unit getHitPointDamage "HitBody") +
    (_unit getHitPointDamage "HitLeftArm") +
    (_unit getHitPointDamage "HitRightArm") +
    (_unit getHitPointDamage "HitLeftLeg") +
    (_unit getHitPointDamage "HitRightLeg");
  if (_damagesum <= 0.06) then {
    _unit setDamage 0;
  };
};
