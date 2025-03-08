#include "..\script_component.hpp"
/*
 * Author: commy2
 * Unit pardons target unit.
 *
 * Arguments:
 * 0: Unit (not used) <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_interaction_fnc_pardon
 *
 * Public: No
 */

params ["", "_target"];

[QGVAR(pardon), _target, _target] call CBA_fnc_targetEvent;
