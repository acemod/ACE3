params ["_unit", "_syncValues"];

private _bloodPressure = GET_BLOOD_PRESSURE(_unit);
_unit setVariable [VAR_BLOOD_PRESS, _bloodPressure, _syncValues];
