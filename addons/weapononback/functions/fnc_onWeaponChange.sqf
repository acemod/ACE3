#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Handles switching to the weapon on the back.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Weapon that was swapped to <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
params ["", "_weapon"];

if (_weapon != QGVAR(weapon)) exitWith {};

[FUNC(swap), [], 2] call CBA_fnc_waitAndExecute;
