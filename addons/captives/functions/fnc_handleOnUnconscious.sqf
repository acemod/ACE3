/*
 * Author: commy2, PabstMirror
 * Handles the "ace_unconscious" event
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 0: Is Unconsisisiouses <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, true] call ACE_captives_fnc_handleOnUnconscious
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit","_isUnconc"];

if (!local _unit) exitWith {};

if (_isUnconc) then {
    //Knocked out: If surrendering, stop
    if (_unit getVariable [QGVAR(isSurrendering), false]) then {
        [_unit, false] call FUNC(setSurrendered);
    };
} else {
    //Woke up: if handcuffed, goto animation
    if (_unit getVariable [QGVAR(isHandcuffed), false] && {vehicle _unit == _unit}) then {
        [_unit] call EFUNC(common,fixLoweredRifleAnimation);
        [_unit, "ACE_AmovPercMstpScapWnonDnon", 1] call EFUNC(common,doAnimation);
    };
};
