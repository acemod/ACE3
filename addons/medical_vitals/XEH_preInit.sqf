#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

GVAR(spo2DutyList) = createHashMap;
GVAR(oxygenSupplyConditionCache) = uiNamespace getVariable QGVAR(oxygenSupplyConditionCache);

ADDON = true;
