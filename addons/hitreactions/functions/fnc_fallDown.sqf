#include "script_component.hpp"
/*
 * Author: commy2
 * Adds reactions to a unit that was hit. EH only runs where to unit is local. Adds screams, falling down, falling from ladders, ejecting from static weapons and camshake for players
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: firer <OBJECT>
 * 2: damage taken <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, kevin, 5] call ACE_hitreactions_fnc_fallDown
 *
 * Public: No
 */

params ["_unit", "_firer", "_damage"];

// exit if system is disabled
if (GVAR(minDamageToTrigger) == -1) exitWith {};

// don't fall after minor damage
if (_damage < GVAR(minDamageToTrigger)) exitWith {};

// don't fall on collision damage
if (_unit == _firer) exitWith {};

// camshake for player
if (_unit == ACE_player) then {
    if (visibleMap) then {
        openMap false;
    };
    addCamShake [3, 5, _damage + random 10];
};

private _vehicle = vehicle _unit;

// handle static weapons
if (_vehicle isKindOf "StaticWeapon") exitWith {
    if (!alive _unit) then {
        _unit action ["Eject", _vehicle];
        unassignVehicle _unit;
    };
};

// don't do animations if in a vehicle (looks weird and animations never reset):
if (_vehicle != _unit) exitWith {};

// this checks most things, so it doesn't mess with being inside vehicles or while dragging etc.
if !([_unit, _vehicle] call EFUNC(common,canInteractWith)) exitWith {};

// handle ladders
if (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> animationState _unit >> "ACE_isLadder") == 1) exitWith {
    _unit action ["LadderOff", nearestObject [position _unit, "House"]];
};

// only play animation when standing due to lack of animations, sry
if !(stance _unit in ["CROUCH", "STAND"]) exitWith {};

private _velocity = vectorMagnitude velocity _unit;

// only fall when moving
if (_velocity < 2) exitWith {};

// get correct animation by weapon
private _anim = _unit call FUNC(getRandomAnimation);

// exit if no animation for this weapon exists, i.e. binocular or rocket launcher
if (_anim == "") exitWith {};

// don't mess with transitions. don't fall then.
if !([_unit] call EFUNC(common,inTransitionAnim)) then {
    [_unit, _anim, 2] call EFUNC(common,doAnimation);
};
