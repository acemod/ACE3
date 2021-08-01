#include "script_component.hpp"
/*
 * Author: Seb
 * Checks if the unit is allowed to rename its group.
 *
 * Arguments:
 * 0: Unit <Object>
 *
 * Return Value:
 * Is this unit allowed to rename its group? <BOOL>
 *
 * Example:
 * player call ace_interaction_fnc_canRenameGroup
 *
 * Public: No
 */

params ["_unit"];
GVAR(enableGroupRenaming) && _unit isEqualTo leader _unit
