/*
 * Author: commy2
 *
 * hint every frame the Variable ACE_isUsedBy from the input Object
 *
 * Arguments:
 * 0: Object
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

GVAR(Debug_Object) = _this select 0;

if (!isNil QGVAR(showUserPFH)) exitWith {};
GVAR(showUserPFH) = [{
    hintSilent str (GVAR(Debug_Object) getVariable ["ACE_isUsedBy", objNull]);
}, 0, []] call CBA_fnc_addPerFrameHandler;
nil
