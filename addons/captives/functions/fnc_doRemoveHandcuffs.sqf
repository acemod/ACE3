#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Remove handcuffs from a target
 *
 * Arguments:
 * 0: Caller <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [bob, bill] call ACE_captives_fnc_doRemoveHandcuffs
 *
 * Public: No
 */

params ["_unit", "_target"];

[QGVAR(setHandcuffed), [_target, false, _unit], [_target]] call CBA_fnc_targetEvent;
