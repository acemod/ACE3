#include "script_component.hpp"
/*
 * Author: jaynus / nou
 * Seeker Type: Optic
 *
 * Arguments:
 * 1: Guidance Arg Array <ARRAY>
 * 2: Seeker State <ARRAY>
 *
 * Return Value:
 * Missile Aim PosASL <ARRAY>
 *
 * Example:
 * [[], [], []] call ace_missileguidance_fnc_seekerType_Optic;
 *
 * Public: No
 */

params ["_projectile", "_seekerType","_targetInfo"];
_targetInfo params ["_target","_targetPos","_targetVector","_launchPos"];

private _inc = 2;
private _incSpacing = 0.4;
private _projPos = getPosASL _projectile;



for "_i" from -(_inc) to _inc do {
    for "_j" from -(_inc) to _inc do {
        
    };
};