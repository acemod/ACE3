/*
 * Author: commy2
 * TODO
 *
 * Arguments:
 * 0: _unit <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * TODO
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_unit);


// prevent players from throwing grenades
[_unit, "Throw", {(_this select 1) getVariable ["ACE_isCaptive", false]}, {}] call EFUNC(common,addActionEventhandler);
