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
 * [bob] call ACE_captives_fnc_handleWokeUp
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_unit);

if (_unit getVariable [QGVAR(isHandcuffed), false] && {vehicle _unit == _unit}) then {
    [_unit] call EFUNC(common,fixLoweredRifleAnimation);
    [_unit, "ACE_AmovPercMstpScapWnonDnon", 0] call EFUNC(common,doAnimation);
};
