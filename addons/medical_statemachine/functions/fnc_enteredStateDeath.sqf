#include "script_component.hpp"
/*
 * Author: SilentSpike
 * Handles a unit reaching the point of death (calls for a status update).
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_medical_statemachine_fnc_enteredStateDeath
 *
 * Public: No
 */

[{
    params ["_unit"];

    // TODO: Probably also needs additional logic to deal with edge cases

    // Send a local event before death
    [QEGVAR(medical,death), [_unit]] call CBA_fnc_localEvent;

    private _deathReason = _unit getVariable [QGVAR(deathReason), nil];
    [_unit, _deathReason] call EFUNC(medical_status,setDead);
}, _this] call CBA_fnc_execNextFrame;
