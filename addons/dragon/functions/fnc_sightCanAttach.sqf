#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Determines if you can attach the sighting unit to the Dragon missile.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Unit Performing Action <OBJECT>
 *
 * Return Value:
 * Can Attach Sighting Unit <BOOL>
 *
 * Example:
 * [cursorObject, player] call ace_dragon_fnc_sightCanAttach
 *
 * Public: No
 */

params ["_target", "_unit"];

(alive _target)
&& {!(_target getVariable [QGVAR(sightAttached), ((typeOf _target) == QGVAR(staticAssembled))])}
&& {QGVAR(sight) in (weapons _unit)}
