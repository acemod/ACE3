#include "script_component.hpp"
/*
 * Author: LorenLuke
 * Do attack profile based on seeker target direction
 *
 * Arguments:
 * 0: projectile <obj>
 * 1: seeker target dir <ARRAY>
 * 2: profileVars <ARRAY>
 *
 * Return Value:
 * Missile Aim direction <ARRAY>
 *
 * Example:
 * [[1,2,3], [], []] call ace_missileguidance_fnc_doAttackProfile;
 *
 * Public: No
 */

params ["_projectile","_seekerTargetDir","_profileVars"];
_profileVars params ["_attackProfileName"];

private _attackProfileFunction = getText (configFile >> QGVAR(AttackProfiles) >> _attackProfileName >> "functionName");

private _attackProfileDir = _this call (missionNamespace getVariable _attackProfileFunction);

if ((isNil "_attackProfilePos") || {_attackProfileDir isEqualTo [0,0,0]}) exitWith {
    [0,0,0]
};

_attackProfileDir;
