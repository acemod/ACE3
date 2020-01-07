#include "script_component.hpp"
/*
 * Author: LorenLuke
 * References and returns a direction based on a projectile's seeker parameters
 *
 * Arguments:
 * 0: Projectile <OBJECT>
 * 1: seekerVars <List>
 *
 * Return Value:
 * Absolute Vector <ARRAY>
 *
 * Example:
 * [missile, [0,1,0]] call ace_guidance_fnc_torqueProjectile;
 *
 * Public: No
 */
params ["_projectile", "_shooter","_extractedInfo"];
_targetInfo params ["_seekerType","_attackProfile","_target","_targetPos","_targetVector","_launchPos", "_miscSeeker", "_miscProfile"];

private _seekerSearchPos = [0,0,0];

private _seekerFunction = getText (configFile >> QGVAR(SeekerTypes) >> _seekerType >> "functionName");

private _seekerSearchPos = _this call (missionNamespace getVariable _seekerFunction);

_seekerSearchPos;
