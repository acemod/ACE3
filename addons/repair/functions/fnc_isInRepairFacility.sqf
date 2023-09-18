#include "script_component.hpp"
/*
 * Author: Glowbal
 * Checks if a unit is in a repair facility.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Is inside a repair facility <BOOL>
 *
 * Example:
 * [unit] call ace_repair_fnc_isInRepairFacility
 *
 * Public: Yes
 */

#define CHECK_OBJECTS(var) ((var) findIf {(_x getVariable ["ACE_isRepairFacility", getNumber (configOf _x >> QGVAR(canRepair))] > 0) && {!(_x isKindOf "AllVehicles")} && {alive _x}} != -1)

params [["_object", objNull, [objNull]]];
TRACE_1("params",_object);


private _fnc_check = {
    private _position = _object modelToWorldVisual [0, 0, eyePos _object select 2];
    CHECK_OBJECTS(lineIntersectsWith [ARR_3(_position, _position vectorAdd [ARR_3(0, 0, 10)], _object)]) || {CHECK_OBJECTS(_object nearObjects 7.5)}
};

[[], _fnc_check, _object, QGVAR(inRepairFacilityCache), IN_REPAIR_FACILITY_CACHE_EXPIRY] call EFUNC(common,cachedCall);
