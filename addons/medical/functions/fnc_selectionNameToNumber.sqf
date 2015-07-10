/*
 * Author: Glowbal
 * Get the number representation of a selection name.
 *
 * Arguments:
 * 0: The selection name of a unit <STRING>
 *
 * ReturnValue:
 * Number representation. -1 if invalid. <NUMBER>
 *
 * Public: yes
 */

#include "script_component.hpp"

(GVAR(SELECTIONS) find (_this select 0));
