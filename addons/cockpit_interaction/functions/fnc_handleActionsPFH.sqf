/*
 * Author: BaerMitUmlaut
 * PFH for handling vehicle actions.
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_helo] call ace_cockpit_interaction_fnc_handleActionsPFH
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_arguments", "_pfhHandle"];
_arguments params ["_vehicle"];

if (_vehicle getVariable [QGVAR(hasElectricalPower), false]) then {
    if !((isCollisionLightOn _vehicle) isEqualTo (_vehicle getVariable [QGVAR(collisionLightsOn), false])) then {
        [_vehicle] call FUNC(switchCollisionLight);
    };
    if !((isLightOn _vehicle) isEqualTo (_vehicle getVariable [QGVAR(mainLightsOn), false])) then {
        [_vehicle] call FUNC(switchMainLight);
    };
} else {
    _vehicle setCollisionLight false;
    _vehicle setPilotLight false;
};
