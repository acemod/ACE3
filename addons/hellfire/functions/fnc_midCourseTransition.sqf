#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Condition to switch to next navigation profile
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_hellfire_fnc_midCourseTransition
 *
 * Public: No
 */

params ["_args", "_timestep"];
_args params ["_firedEH", "_launchParams", "_flightParams", "_seekerParams", "_stateParams", "_targetData", "_navigationStateData"];
_firedEH params ["_shooter","","","","_ammo","","_projectile"];
_launchParams params ["_shooter","_targetLaunchParams","_seekerType","_attackProfile","_lockMode","_laserInfo","_navigationType"];
_targetLaunchParams params ["_target", "_targetPos", "_launchPos", "_launchDir", "_launchTime"];
_flightParams params ["_pitchRate", "_yawRate", "_isBangBangGuidance"];
_stateParams params ["_lastRunTime", "_seekerStateParams", "_attackProfileStateParams", "_lastKnownPosState","_navigationParams", "_guidanceParameters"];
_seekerParams params ["_seekerAngle", "_seekerAccuracy", "_seekerMaxRange", "_seekerMinRange"];
_targetData params ["_targetDirection", "_attackProfileDirection", "_targetRange", "_targetVelocity", "_targetAcceleration"];

_attackProfileStateParams params ["_state"];
_state isEqualTo STAGE_ATTACK_TERMINAL;

