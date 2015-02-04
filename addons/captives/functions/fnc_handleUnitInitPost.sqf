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

// prevent players from throwing grenades
[_unit, "Throw", {(_this select 1) getVariable ["ACE_isCaptive", false]}, {}] call EFUNC(common,addActionEventhandler);

if (local _unit) then {
    // reset status on mission start
    if (_unit getVariable ["ACE_isCaptive", false]) then {
        _unit setVariable ["ACE_isCaptive", false];
        [_unit, true] call FUNC(setCaptive);
    };
};
