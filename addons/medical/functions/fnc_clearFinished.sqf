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
private _itemCount = 0;

if !(_joint isEqualTo []) then {
    {
        if ((_x select 0) isEqualTo _caller) then {
            _joint deleteAt _itemCount;
        };
        _itemCount = _itemCount + 1;
    } forEach _joint;
};

_target setVariable [QGVAR(jointTreatment), _joint, true];
