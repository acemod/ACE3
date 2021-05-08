#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Picks up plug from ground
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player] call ace_malyutka_fnc_pickupPlug
 *
 * Public: No
 */
params ["_unit", "_handle"];

_handle attachTo [_unit, [0, 1, 0], "pelvis"];
_unit setVariable [QGVAR(carryingPlug), _handle];
_plug setVariable [QGVAR(dropped), false];
[_unit] call EFUNC(weaponselect,putWeaponAway);
[_unit, _handle] call FUNC(carryPlugPFH);

 