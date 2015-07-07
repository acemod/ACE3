/*
 * Author: BaerMitUmlaut
 * Checks if there is a wall within 2m in front of the player.
 *
 * Arguments:
 * None
 * 
 * Return Value:
 * Is wall taggable <BOOL>
 *
 * Example:
 * [] call ace_tagging_fnc_checkTaggable
 *
 * Public: No
 */


#include "script_component.hpp"
private ["_posCheck", "_objectsLeft", "_intersectsLeft", "_objectsRight", "_intersectsRight"];


_posCheck = ACE_player modelToWorldVisual [-0.5, 2, 0];
_posCheck set [2, (eyePos ACE_player) select 2];

_objectsLeft = lineIntersectsWith [eyePos ACE_player, _posCheck, ACE_player, objNull, false];
_intersectsLeft = false;
{
    if (_x isKindOf "Static") exitWith {_intersectsLeft = true};
} foreach _objectsLeft;

if (!_intersectsLeft) exitWith {false};


_posCheck = ACE_player modelToWorldVisual [0.5, 2, 0];
_posCheck set [2, (eyePos ACE_player) select 2];

_objectsRight = lineIntersectsWith [eyePos ACE_player, _posCheck, ACE_player, objNull, false];
_intersectsRight = false;
{
    if (_x isKindOf "Static") exitWith {_intersectsRight = true};
} foreach _objectsRight;


//for readability...
(_intersectsLeft && _intersectsRight)