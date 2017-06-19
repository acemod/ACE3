/*
 * Author: Glowbal
 * Get the number representation of a selection name.
 *
 * Arguments:
 * 0: The selection name of a unit <STRING>
 *
 * Return Value:
 * Number representation. -1 if invalid. <NUMBER>
 *
 * Example:
 * ["head"] call ace_medical_fnc_selectionNameToNumber
 *
 * Public: yes
 */

#include "script_component.hpp"

(["head","body","hand_l","hand_r","leg_l","leg_r"] find (_this select 0));
