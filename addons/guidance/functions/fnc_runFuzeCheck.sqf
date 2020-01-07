#include "script_component.hpp"
/*
 * Author: jaynus / nou
 * Seeker Type: Optic
 *
 * Arguments:
 * 0: Projectile <OBJ>
 * 1: Seeker Search Direction <NUMBER>
 * 2: Seeker Max Angle <NUMBER>
 * 3: Seeker Misc <ARRAY>
 *
 * Return Value:
 * Vector to target position <ARRAY>
 *
 * Example:
 * [[], [], []] call ace_missileguidance_fnc_seekerType_INS;
 *
 * Public: No
 */

params ["_projectile", "_fuzeVars"]
_fuzeVars params ["_fuzeRange", "_fuzeDist", "_fuzeTime", "_fuzeMisc"];

_fuzeMisc params ["_active", "_detectsTerrain", "_distanceDetonate", "_timeDetonate", "_minimumSeekerAngle","_maximumSeekerAngle"];

_posList = [];

if(!_active) exitWith {false};

_currentWaypoint = _waypoints select 0;

_projPos = getPosASL _projectile;


if((_projPos distance _currentWaypoint) < _waypointDistance) then {
	_waypoints deleteAt 0; 
	_currentWaypoint = _waypoints select 0;
};

_vect = vectorNormalized (_currentWaypoint vectorDiff _projPos);
