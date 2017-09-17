/*
 * Author: 654wak654
 * Adds child actions to the "load patient" action for near vehicles
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 *
 * Return Value:
 * The child actions
 *
 * Example:
 * [bob, kevin] call ace_medical_fnc_addLoadPatientActions
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_caller", "_target"];

private _statement = {
    params ["_target", "_player", "_vehicle"];
    [_player, _target, _vehicle] call FUNC(actionLoadUnit);
};

[_target call EFUNC(common,nearestVehiclesFreeSeat), _statement, _target] call EFUNC(interact_menu,createVehiclesActions)
