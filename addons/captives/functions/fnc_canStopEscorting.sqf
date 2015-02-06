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

PARAMS_1(_unit);
DEFAULT_PARAM(1,_target,objNull);

private ["_isAttached"];

if (isNull _target) then {
    _target = _unit getVariable [QGVAR(escortedUnit), objNull];
};

if (isNull _target) exitWith {
    ERROR("Null Target (no ACE_escortedUnit)");
    false
};

_isAttached = _target in (attachedObjects _unit);

if (_isAttached && (!(_target getVariable [QGVAR(isHandcuffed), false]))) exitWith {
    ERROR("Attached But Not Captive");
    false
};

_isAttached
