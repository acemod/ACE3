/*
 * Author: commy2
 * Handles when a player's vehicle changes (supports scripted vehicle changes)
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: newVehicle <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, car] call ACE_captives_fnc_handleVehicleChanged
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_unit,_vehicle);

//When moved into a vehicle (action or scripted)
if ((vehicle _unit) != _unit) then {
    if (_unit getVariable [QGVAR(isEscorting), false]) then {
        _unit setVariable [QGVAR(isEscorting), false, true];
    };

    if (_unit getVariable [QGVAR(isSurrendering), false]) then {
        [_unit, false] call FUNC(surrender);
    };
};
