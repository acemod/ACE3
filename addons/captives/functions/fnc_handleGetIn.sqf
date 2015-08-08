/*
 * Author: commy2
 * Handles when a unit gets in to a vehicle.  Release escorted captive when entering a vehicle
 *
 * Arguments:
 * 0: _vehicle <OBJECT>
 * 2: dunno <OBJECT>
 * 1: _unit <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [car2, x, player] call ACE_captives_fnc_handleGetIn
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle", "_dontcare","_unit"];

if (local _unit) then {
    if (_unit getVariable [QGVAR(isEscorting), false]) then {
        _unit setVariable [QGVAR(isEscorting), false, true];
    };

    if (_unit getVariable [QGVAR(isSurrendering), false]) then {
        [_unit, false] call FUNC(setSurrender);
    };
};
