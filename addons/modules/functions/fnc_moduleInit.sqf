/*
 * Author: Glowbal
 * IV Treatment local callback
 *
 * Arguments:
 * 0: The logic object <OBJECT>
 *
 *
 * Return Value:
 * nil
 *
 * Public: No
 */

#include "script_component.hpp"

if ((_this select 0) isKindOf "Module_F") then {
    GVAR(moduleInitCollection) pushBack (_this select 0);
};
