
#include "script_component.hpp"

params ["_unit", "_stateName"];

// If the unit died the loop is finished
if (!alive _unit) exitWith {};

// If locality changed, broadcast the last medical state and finish the local loop
if (!local _unit) exitWith {
    _unit setVariable [QGVAR(heartRate), _unit getVariable [QGVAR(heartRate), 80], true];
    _unit setVariable [QGVAR(bloodPressure), _unit getVariable [QGVAR(bloodPressure), [80, 120]], true];
    _unit setVariable [QGVAR(bloodVolume), _unit getVariable [QGVAR(bloodVolume), DEFAULT_BLOOD_VOLUME], true];
};

[_unit] call FUNC(handleUnitVitals);

private _pain = _unit getVariable [QGVAR(pain), 0];
if (_pain > (_unit getVariable [QGVAR(painSuppress), 0])) then {
    [_unit, "moan", PAIN_TO_MOAN(_pain)] call EFUNC(medical_engine,playInjuredSound);
};
