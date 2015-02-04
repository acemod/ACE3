/*
 * Author: commy2
 * TODO
 *
 * Arguments:
 * 0: _unit <OBJECT>
 * 1: _oldUnit <OBJECT>
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

PARAMS_2(_unit,_oldUnit);

if (_unit getVariable ["ACE_isCaptive", false]) then {
    showHUD false;
} else {
    showHUD true;
};
