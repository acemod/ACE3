/*
 * Author: Glowbal
 * Called when a unit is killed
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * ReturnValue:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit"];
if (!local _unit) exitWith {};

_unit setVariable [QGVAR(pain), 0];
if (GVAR(level) >= 2) then {
    _unit setVariable [QGVAR(heartRate), 0];
    _unit setVariable [QGVAR(bloodPressure), [0, 0]];
    _unit setVariable [QGVAR(airwayStatus), 0];
};

if (!_unit getVariable ["ACE_isDead", false]) then {
    _unit setVariable ["ACE_isDead", true, true];
    if (isPLayer _unit) then {
        _unit setVariable ["isDeadPlayer", true, true];
    };

    ["ace_killed", [_unit]] call CBA_fnc_localEvent;
}