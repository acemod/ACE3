
#include "script_component.hpp"

params ["_unit", "_stateName", "_lastTime"];

// If the unit died the loop is finished
if (!alive _unit) exitWith {};

// If locality changed, broadcast the last medical state and finish the local loop
if (!local _unit) exitWith {
    if (GVAR(level) >= 2) then {
        _unit setVariable [QGVAR(heartRate), _unit getVariable [QGVAR(heartRate), 80], true];
        _unit setVariable [QGVAR(bloodPressure), _unit getVariable [QGVAR(bloodPressure), [80, 120]], true];
    };
    _unit setVariable [QGVAR(bloodVolume), _unit getVariable [QGVAR(bloodVolume), 100], true];
};

private _startTime = _unit getVariable [QGVAR(reviveStartTime), 0];

// If we are in revive state in a blown up vehicle, try to unload so that people can access the body
if ((alive _unit) && {(vehicle _unit) != _unit} && {!alive (vehicle _unit)}) then {
    TRACE_2("Unloading", _unit, vehicle _unit);
    [_unit] call EFUNC(common,unloadPerson);
};

// Revive timer ran out
if (GVAR(maxReviveTime) > 0 && {CBA_missionTime - _startTime > GVAR(maxReviveTime)}) exitWith {
    [_unit, "ReviveTimer", []] call FUNC(stateEvent);
    _unit setVariable [QGVAR(inReviveState), nil, true];
    _unit setVariable [QGVAR(reviveStartTime), nil];
};

// If the unit was taken out from revive state, exit the loop
if !(_unit getVariable [QGVAR(inReviveState), false]) exitWith {
    // Revived without dieing, so in case we have lifes, remove one.
    if (GVAR(amountOfReviveLives) > 0) then {
        _lifesLeft = _unit getVariable [QGVAR(amountOfReviveLives), GVAR(amountOfReviveLives)];
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

[_unit, CBA_missionTime - _lastTime] call FUNC(handleUnitVitals);

private _pain = _unit getVariable [QGVAR(pain), 0];
if (_pain > (_unit getVariable [QGVAR(painSuppress), 0])) then {
    [_unit, _pain] call FUNC(playInjuredSound);
};
