/*
 * Author: Glowbal
 * Drop a unit if the caller nit is currently dragging or carrying a unit
 *
 * Arguments:
 * 0: The caller <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Public: No
 */

#include "script_component.hpp"

private "_caller";
_caller = _this select 0;

if (!isnil QGVAR(DROP_ADDACTION)) then {
	[_caller,objNull] call EFUNC(common,carryObj);
	_caller removeAction GVAR(DROP_ADDACTION);
    GVAR(DROP_ADDACTION) = nil;
};
