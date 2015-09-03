/*
 * Author: KoffeinFlummi
 * Callback when the bandaging treatment is complete
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: Selection Name <STRING>
 * 3: Treatment classname <STRING>
 *
 * Return Value:
 * nil
 *
 * Public: No
 */

#include "script_component.hpp"
#define BANDAGEHEAL 0.8

private ["_caller", "_target","_selection","_className","_target","_hitSelections","_hitPoints","_point", "_damage"];
_caller = _this select 0;
_target = _this select 1;
_selection = _this select 2;
_className = _this select 3;

if (_selection == "all") then {
    _target setDamage ((damage _target - BANDAGEHEAL) max 0);
} else {
    _hitSelections = ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"];
    _hitPoints = ["HitHead", "HitBody", "HitLeftArm", "HitRightArm", "HitLeftLeg", "HitRightLeg"];
    _point = _hitPoints select (_hitSelections find _selection);

    _damage = ((_target getHitPointDamage _point) - BANDAGEHEAL) max 0;
    [_target, _point, _damage] call FUNC(setHitPointDamage);
};
