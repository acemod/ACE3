#include "script_component.hpp"
/*
 * Author: commy2
 * Falling down, falling from ladders, ejecting from static weapons and camshake for players.
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ACE_hitreactions_fnc_fallDown
 *
 * Public: No
 */

params ["_unit"];

private _vehicle = vehicle _unit;

// handle static weapons
if (_vehicle isKindOf "StaticWeapon") exitWith {
    if (!alive _unit) then {
        _unit action ["Eject", _vehicle];
        unassignVehicle _unit;
    };
};

if (_vehicle != _unit) exitWith {};
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
