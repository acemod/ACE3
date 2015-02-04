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

// reset status on mission start
if (_unit getVariable ["ACE_isCaptive", false]) then {
    _unit setVariable ["ACE_isCaptive", false];
    [_unit, true] call ACE_Captives_fnc_setCaptive;
};
