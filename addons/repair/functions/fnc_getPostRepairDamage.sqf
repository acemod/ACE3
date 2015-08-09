// by comm2
#include "script_component.hpp"

params ["_unit"];
TRACE_1("params",_unit);
// TODO when near repair station, full repair?

if (([_caller] call FUNC(isInRepairFacility) || {[_caller] call FUNC(isNearRepairVehicle)})) exitwith {0};

if ([_unit, GVAR(engineerSetting_Repair) + 1] call FUNC(isEngineer)) exitWith {GVAR(repairDamageThreshold_Engineer)};
if ([_unit, GVAR(engineerSetting_Repair)] call FUNC(isEngineer)) exitWith {GVAR(repairDamageThreshold)};
0.3;
