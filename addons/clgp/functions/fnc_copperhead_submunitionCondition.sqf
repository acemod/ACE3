#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Copperhead: submunition condition, checks if shell should become missile (wings deploy)
 *
 * Arguments:
 * Args
 *
 * Return Value:
 * None
 *
 * Example:
 * [any, vehicle player] call ace_clgp_fnc_copperhead_submunitionCondition
 *
 * Public: No
 */

params ["", "", "", "", "_stateParams"];
_stateParams params ["_lastRunTime", "", "_attackProfileStateParams"];
_attackProfileStateParams params ["_delayDeployment"];

private _runtimeDelta = cba_missionTime - _lastRunTime;
_runtimeDelta > _delayDeployment // return
