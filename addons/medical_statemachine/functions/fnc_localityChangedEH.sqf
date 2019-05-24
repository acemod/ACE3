#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Handles locality switch.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: isLocal <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, true] call ace_medical_statemachine_fnc_localityChangedEH
 *
 * Public: No
 */

params ["_unit", "_isLocal"];
TRACE_2("localityChangedEH",_unit,_isLocal);

if (!alive _unit) exitWith {TRACE_1("dead", _this)};

if (!_isLocal) then {
    // If locality changed, broadcast the last medical state
    _unit setVariable [VAR_HEART_RATE, GET_HEART_RATE(_unit), true];
    _unit setVariable [VAR_BLOOD_PRESS, _unit getVariable [VAR_BLOOD_PRESS, [80, 120]], true];
    _unit setVariable [VAR_BLOOD_VOL, GET_BLOOD_VOLUME(_unit), true];

    private _currentState = [_unit, EGVAR(medical,STATE_MACHINE)] call CBA_statemachine_fnc_getCurrentState;
    TRACE_2("sending current state",_unit,_currentState);
    [QGVAR(localityTransfer), [_unit, _currentState], _unit] call CBA_fnc_targetEvent;
};
