/*
 * Author: PabstMirror
 * Tests if player can stop escorting
 *
 * Arguments:
 * 0: caller (player) <OBJECT>
 * 1: target <OBJECT><OPTIONAL>
 *
 * Return Value:
 * The return value <BOOL>
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
