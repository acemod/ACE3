#include "script_component.hpp"
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
 * [bob] call ACE_captives_fnc_handleUnitInitPost
 *
 * Public: No
 */

params ["_unit"];

// prevent players from throwing grenades (added to all units)
// [_unit, "Throw", {systemChat "a"; ((_this select 1) getVariable [QGVAR(isHandcuffed), false]) || {(_this select 1) getVariable [QGVAR(isSurrendering), false]}; true}, {systemChat "b";}] call EFUNC(common,addActionEventhandler);

if (local _unit) then {
    // reset status on mission start
    if (_unit getVariable [QGVAR(isHandcuffed), false]) then {
        _unit setVariable [QGVAR(isHandcuffed), false];
        [_unit, true] call FUNC(setHandcuffed);
    };

    if (_unit getVariable [QGVAR(isSurrendering), false]) then {
        _unit setVariable [QGVAR(isSurrendering), false];
        [_unit, true] call FUNC(setSurrendered);
    };
};
