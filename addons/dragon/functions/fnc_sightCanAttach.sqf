#include "..\script_component.hpp"
/*
 * Author: tcvm
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
&& {"ACE_M47_Daysight" in (weapons _unit)}
