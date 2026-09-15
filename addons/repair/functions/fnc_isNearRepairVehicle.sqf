#include "..\script_component.hpp"
/*
 * Author: KoffeinFlummi
 * Checks if a unit is near an engineering vehicle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Is near engineering vehicle <BOOL>
 *
 * Example:
 * [unit] call ace_repair_fnc_isNearRepairVehicle
 *
 * Public: Yes
 */

#define CHECK_OBJECTS(var) ((var) findIf {alive _x && {[_x] call FUNC(isRepairVehicle)}} != -1)

params ["_unit"];
TRACE_1("params",_unit);

private _fnc_check = {
    private _nearObjects = nearestObjects [_unit, ["Air", "LandVehicle", "Ship", "ThingX"], 20];
    CHECK_OBJECTS(_nearObjects)
};

[[], _fnc_check, _unit, QGVAR(nearRepairVehicleCache), NEAR_REPAIR_VEHICLE_CACHE_EXPIRY] call EFUNC(common,cachedCall);
