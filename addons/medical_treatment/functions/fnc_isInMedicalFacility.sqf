#include "script_component.hpp"
/*
 * Author: Glowbal, mharis001
 * Checks if the unit is in a medical facility.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * In Medical Facility <BOOL>
 *
 * Example:
 * [player] call ace_medical_treatment_fnc_isInMedicalFacility
 *
 * Public: No
 */

#define CHECK_OBJECTS(var) ((var) findIf {typeOf _x in GVAR(facilityClasses) || {_x getVariable [QEGVAR(medical,isMedicalFacility), false]}} != -1)

params ["_unit"];

private _fnc_check = {
    private _position = _unit modelToWorldVisual [0, 0, eyePos _unit select 2];
    CHECK_OBJECTS(ARR_5(lineIntersectsWith [_position, _position vectorAdd [0, 0, 10], _unit])) || {CHECK_OBJECTS(_unit nearObjects 7.5)}
};

[[], _fnc_check, _unit, QGVAR(inMedicalFacilityCache), IN_MEDICAL_FACILITY_CACHE_EXPIRY] call EFUNC(common,cachedCall);
