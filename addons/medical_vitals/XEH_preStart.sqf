#include "script_component.hpp"

#include "XEH_PREP.hpp"

GVAR(oxygenSupplyConditionCache) = createHashMap;

call FUNC(scanConfig);

GVAR(oxygenSupplyConditionCache) = compileFinal GVAR(oxygenSupplyConditionCache);
