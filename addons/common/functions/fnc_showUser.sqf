/*
 * Author: commy2
 *
 * ?
 *
 * Arguments:
 * ?
 *
 * Return Value:
 * ?
 *
 * Public: No
 */
#include "script_component.hpp"

GVAR(Debug_Object) = _this select 0;

onEachFrame {
    hintSilent str (GVAR(Debug_Object) getVariable ["ACE_isUsedBy", objNull]);
};
