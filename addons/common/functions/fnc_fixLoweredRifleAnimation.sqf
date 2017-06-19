/*
 * Author: commy2
 * Fixes the lowered rifle animation
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player] call ace_common_fnc_fixLoweredRifleAnimation
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

if (currentWeapon _unit != "" && {currentWeapon _unit == primaryWeapon _unit} && {weaponLowered _unit} && {stance _unit == "STAND"} && {vehicle _unit == _unit}) then {
    [_unit, "amovpercmstpsraswrfldnon", 0] call FUNC(doAnimation);
};
