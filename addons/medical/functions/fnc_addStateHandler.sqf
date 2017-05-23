/*
 * Author: Glowbal
 * [Description]
 *
 * Arguments:
 * 0: Argument Name <TYPE>
 *
 * Return Value:
 * Return Name <TYPE>
 *
 * Example:
 * ["example"] call ace_[module]_fnc_[functionName]
 *
 * Public: [Yes/No]
 */
#include "script_component.hpp"

params ["_unit", "_stateMachine"];

if (_unit in GVAR(monitoredUnitsList)) exitWith {}; // already monitored
private _defaultState = _stateMachine getVariable "cba_stateMachine_initialState"; // "Default"
if (!isNil "_defaultState") then {
    systemChat format["Assigned default state to: %1. Total monitored: %2", _unit, GVAR(monitoredUnitsList)];
    _unit setVariable[QGVAR(state), [-1, _defaultState]];
    GVAR(monitoredUnitsList) pushBack _unit;
};
