
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

[_unit, CBA_missionTime - _lastTime] call FUNC(handleUnitVitals);

private _pain = _unit getVariable [QGVAR(pain), 0];
if (_pain > (_unit getVariable [QGVAR(painSuppress), 0])) then {
    [_unit, _pain] call FUNC(playInjuredSound);
};
