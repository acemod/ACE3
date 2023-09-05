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

_unit removeItem (_validBlindfolds select _carriedBlindfoldIdx);

// Remove _target goggles if it is wearing any and move them to _unit or _target inventory (if they can hold them)
private _previousGoggles = goggles _target;
if (_previousGoggles != "") then {
    if ([_unit, _previousGoggles] call CBA_fnc_canAddItem) exitWith {
        removeGoggles _target;
        _unit addItem _previousGoggles;
    };
    if ([_target, _previousGoggles] call CBA_fnc_canAddItem) exitWith {
        removeGoggles _target;
        _target addItem _previousGoggles;
    };
    // if the target goggles can fit in neither _unit nor _target inventory, drop them on the ground
    [_target, _previousGoggles] call CBA_fnc_dropItem;
};

_target addGoggles (_validBlindfolds select _carriedBlindfoldIdx);


