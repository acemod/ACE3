#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Return a suitable position for the action point for the current weapon
 *
 * Arguments:
 * None (uses local variable _target)
 *
 * Return Value:
 * Children actions <ARRAY>
 *
 * Example:
 * call ace_interaction_fnc_getWeaponPos
 *
 * Public: No
 */
// IGNORE_PRIVATE_WARNING(_target);

private _weaponDir = _target weaponDirection currentWeapon _target;
private _refSystem = _weaponDir call EFUNC(common,createOrthonormalReference);

(_target selectionPosition "righthand") vectorAdd ((_refSystem select 2) vectorMultiply 0.1);
