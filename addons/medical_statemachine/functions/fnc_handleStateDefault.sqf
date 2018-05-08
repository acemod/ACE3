
#include "script_component.hpp"

params ["_unit", "_stateName"];

// If the unit died the loop is finished
if (!alive _unit) exitWith {};

// If locality changed, broadcast the last medical state and finish the local loop
if (!local _unit) exitWith {
    SET_HEART_RATE(_unit,GET_HEART_RATE(_unit));
    _unit setVariable [QGVAR(bloodPressure), _unit getVariable [QGVAR(bloodPressure), [80, 120]], true];
    _unit setVariable [QGVAR(bloodVolume), _unit getVariable [QGVAR(bloodVolume), DEFAULT_BLOOD_VOLUME], true];
};

[_unit] call EFUNC(medical_vitals,handleUnitVitals);

private _painLevel = GET_PAIN_PERCEIVED(_unit);
if (_painLevel > 0) then {
    [_unit, "moan", PAIN_TO_MOAN(_painLevel)] call EFUNC(medical_engine,playInjuredSound);
};
