/*
 * Author: PabstMirror
 * Remove handcuffs from a target
 *
 * Arguments:
 * 0: target <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [bob, false] call ACE_captives_fnc_doRemoveHandcuffs
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_target"];

[QGVAR(setHandcuffed), [_target, false], [_target]] call CBA_fnc_targetEvent;
