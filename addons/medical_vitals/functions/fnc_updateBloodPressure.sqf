#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Update unit blood pressure
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Sync value? <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, false] call ace_medical_vitals_fnc_updateBloodPressure
 *
 * Public: No
 */

params ["_unit", "_syncValues"];

private _bloodPressure = GET_BLOOD_PRESSURE(_unit);
_unit setVariable [VAR_BLOOD_PRESS, _bloodPressure, _syncValues];
