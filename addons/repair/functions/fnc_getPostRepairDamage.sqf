// by comm2
#include "script_component.hpp"

params ["_unit"];
TRACE_1("params",_unit);

if ([_unit, GVAR(engineerSetting_Repair) + 1] call FUNC(isEngineer)) exitWith {GVAR(repairDamageThreshold_Engineer)};
if ([_unit, GVAR(engineerSetting_Repair)] call FUNC(isEngineer)) exitWith {GVAR(repairDamageThreshold)};

1
