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
 * [any, vehicle player] call ace_missile_clgp_fnc_copperhead_deployCondition
 *
 * Public: No
 */

params ["_projectile"];

private _deployTime = _projectile getVariable [QGVAR(deployTime), -1];
CBA_missionTime > _deployTime
