#include "script_component.hpp"
/*
 * Author: 654wak654
 * Returns children actions to the "Load Patient" action for nearby vehicles.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [cursorObject] call ace_medical_treatment_fnc_addLoadPatientActions
 *
 * Public: No
 */

params ["_target"];

private _statement = {
    params ["_target", "_player", "_vehicle"];
    [_player, _target, _vehicle] call FUNC(loadUnit);
};

[_target call EFUNC(common,nearestVehiclesFreeSeat), _statement, _target] call EFUNC(interact_menu,createVehiclesActions)
