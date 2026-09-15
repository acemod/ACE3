#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Copperhead: submunition condition, checks if shell should become missile (wings deploy)
 *
 * Arguments:
 * 0: Projectile <OBJECT>
 *
 * Return Value:
 * <BOOL>
 *
 * Example:
 * [shell] call ace_missile_clgp_fnc_copperhead_deployCondition
 *
 * Public: No
 */

params ["_projectile"];

// gyro waits for downward movement
if (((velocity _projectile) select 2) > -2) exitWith { false };

// check deploy time
private _deployTime = _projectile getVariable [QGVAR(deployTime), -1];
CBA_missionTime > _deployTime
