/*
 * Author: Glowbal
 * Get the string representation of a selection index.
 *
 * Arguments:
 * 0: The selection index of a unit <STRING>
 *
 * ReturnValue:
 * String representation. any if invalid. <NUMBER>
 *
 * Public: yes
 */

#include "script_component.hpp"

(GVAR(SELECTIONS) select (_this select 0));
