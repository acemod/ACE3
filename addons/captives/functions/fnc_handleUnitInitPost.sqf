/*
 * Author: commy2
 * handle captive and unconsciousness state and prevent grenades
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

// prevent players from throwing grenades (added to all units)
[_unit, "Throw", {(_this select 1) getVariable [QGVAR(isHandcuffed), false]}, {hint format ["%1 - debug throw prevented",time];}] call EFUNC(common,addActionEventhandler);

if (local _unit) then {
    // reset status on mission start
    if (_unit getVariable [QGVAR(isHandcuffed), false]) then {
        _unit setVariable [QGVAR(isHandcuffed), false];
        [_unit, true] call FUNC(setHandcuffed);
    };
};
