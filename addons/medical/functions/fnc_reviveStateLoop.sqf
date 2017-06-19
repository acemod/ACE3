/*
 * Author: Glowbal, esteldunedain
 * Loop that handles a unit in the revive state.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ACE_medical_fnc_reviveStateLoop
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit"];

// If locality changed finish the local loop
// @todo: reinitiate the loop elsewhere
if (!local _unit) exitWith {};

private _startTime = _unit getVariable [QGVAR(reviveStartTime), 0];

// If we are in revive state in a blown up vehicle, try to unload so that people can access the body
if ((alive _unit) && {(vehicle _unit) != _unit} && {!alive (vehicle _unit)}) then {
    TRACE_2("Unloading", _unit, vehicle _unit);
    [_unit] call EFUNC(common,unloadPerson);
};

// If the timer run out, let the unit die and exit the loop
if (GVAR(maxReviveTime) > 0 && {CBA_missionTime - _startTime > GVAR(maxReviveTime)}) exitwith {
    _unit setVariable [QGVAR(inReviveState), nil, true];
    _unit setVariable [QGVAR(reviveStartTime), nil];
    [_unit, true] call FUNC(setDead);
};

// If the unit was taken out from revive state, exit the loop
if !(_unit getVariable [QGVAR(inReviveState), false]) exitwith {
    // Revived without dieing, so in case we have lifes, remove one.
    if (GVAR(amountOfReviveLives) > 0) then {
        _lifesLeft = _unit getVariable[QGVAR(amountOfReviveLives), GVAR(amountOfReviveLives)];
        _unit setVariable [QGVAR(amountOfReviveLives), _lifesLeft - 1, true];
    };

    _unit setVariable [QGVAR(reviveStartTime), nil];
};

// Remove heartbeat
if (GVAR(level) >= 2) then {
    if (_unit getVariable [QGVAR(heartRate), 60] > 0) then {
        _unit setVariable [QGVAR(heartRate), 0];
    };
};

// Schedule the loop to be executed again 1 sec later
[DFUNC(reviveStateLoop), [_unit], 1] call CBA_fnc_waitAndExecute;
