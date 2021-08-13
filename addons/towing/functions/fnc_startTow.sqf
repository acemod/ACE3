#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Start rope attach PFH
 *
 * Arguments:
 * 0: Unit wanting to start towing <OBJECT>
 * 1: Vehicle to tow from <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_towing_fnc_startTow
 *
 * Public: No
 */
params ["_unit", "_target"];

GVAR(attachHelper) = "Sign_Sphere10cm_F" createVehicleLocal [0, 0, 0];
[_unit] call EFUNC(weaponselect,putWeaponAway);

GVAR(canAttach) = false;
[LINKFUNC(towStateMachinePFH), 0, [TOW_STATE_ATTACH_PARENT, _unit, _target, objNull]] call CBA_fnc_addPerFrameHandler;

