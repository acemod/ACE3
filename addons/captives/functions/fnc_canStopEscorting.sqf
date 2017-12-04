/*
 * Author: PabstMirror
 * Tests if player can stop escorting.
 *
 * Arguments:
 * 0: Caller (player) <OBJECT>
 * 1: Target <OBJECT> (default: objNull)
 *
 * Return Value:
 * Can unit stop escorting another unit <BOOL>
 *
 * Example:
 * [player, bob] call ACE_captives_fnc_canStopEscorting
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", ["_target", objNull]];

if (isNull _target) then {
    _target = _unit getVariable [QGVAR(escortedUnit), objNull];
};

if (isNull _target) exitWith {false};

(_target in (attachedObjects _unit)) && {_target getVariable [QGVAR(isHandcuffed), false]}
