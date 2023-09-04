#include "script_component.hpp"
/*
 * Author: mrschick
 * Puts a blindfold on a captive unit if the player has a blindfold in their inventory
 *
 * Arguments:
 * 0: _unit-Player <OBJECT>
 * 1: target <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [player, bob, true] call ACE_captives_fnc_doBlindfoldCaptive;
 *
 * Public: No
 */

params ["_unit", "_target", "_state"];

// check if _unit has a Contact DLC blindfold in its inventory, abort otherwise.
private _validBlindfolds = ["G_Blindfold_01_black_F", "G_Blindfold_01_white_F"];
private _carriedBlindfoldIdx = _validBlindfolds findAny (items _unit);
if (_carriedBlindfoldIdx == -1) exitWith {};

// Remove _target goggles if it is wearing any and move them to _unit inventory
private _previousGoggles = goggles _target;
if (_previousGoggles != "") then {
    removeGoggles _target;
    _unit addItem _previousGoggles;
};

// Add blindfold to _target from _unit inventory
_unit removeItem (_validBlindfolds select _carriedBlindfoldIdx);
_target addGoggles (_validBlindfolds select _carriedBlindfoldIdx);


