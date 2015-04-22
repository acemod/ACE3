// by comm2
#include "script_component.hpp"

private "_unit";

_unit = _this select 0;

if ([_unit, GVAR(engineerSetting_Repair) + 1] call FUNC(isEngineer)) exitWith {GVAR(repairDamageThreshold_Engineer)};
if ([_unit, GVAR(engineerSetting_Repair)] call FUNC(isEngineer)) exitWith {GVAR(repairDamageThreshold)};

1
