#include "..\script_component.hpp"
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
 * player call ace_repair_fnc_isInRepairFacility
 *
 * Public: Yes
 */

#define CHECK_OBJECTS(var) ((var) findIf _checkObject != -1)

params [["_unit", objNull, [objNull]]];
TRACE_1("params",_unit);

private _checkObject = {
    private _config = configOf _x;
    private _canRepair = getNumber (_config >> QGVAR(canRepair));
    if (_canRepair == 0) then {
        _canRepair = getNumber (_config >> "transportRepair");
    };

    _x getVariable ["ACE_isRepairFacility", _canRepair > 0] in [1, true] // can be integer or boolean
    && {!(_x isKindOf "AllVehicles")} // check if it's not repair vehicle
    && {alive _x}
};

private _fnc_check = {
    private _position = _unit modelToWorldVisual [0, 0, eyePos _unit select 2];
    CHECK_OBJECTS(lineIntersectsWith [ARR_3(_position, _position vectorAdd [ARR_3(0, 0, 10)], _unit)])
    || {CHECK_OBJECTS(_unit nearObjects 7.5)}
};

[[], _fnc_check, _unit, QGVAR(inRepairFacilityCache), IN_REPAIR_FACILITY_CACHE_EXPIRY] call EFUNC(common,cachedCall);
