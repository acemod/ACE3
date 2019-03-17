#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Checks if the given helicopter still exits, and if not, destroys the FRIES.
 *
 * Arguments:
 * 0: The helicopter <OBJECT>
 * 1: The helicopter's FRIES <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle, _fries] call ace_fastroping_fnc_checkVehicleThread
 *
 * Public: No
 */
params ["_vehicle", "_fries"];

if (isNull _vehicle) then {
    deleteVehicle _fries;
} else {
    [FUNC(checkVehicleThread), _this, 5] call CBA_fnc_waitAndExecute;
};
