/*
 * Author: Orbis2358
 * Remove finished actions from list
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [medic, patient] call ace_medical_fnc_clearFinished
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_caller", "_target"];

private _joint = _target getVariable [QGVAR(jointTreatment), []];
private _jointNew = _joint select {(_x select 0) != _caller};

if !(_jointNew isEqualTo _joint) then {
    _target setVariable [QGVAR(jointTreatment), _jointNew, true];
};
