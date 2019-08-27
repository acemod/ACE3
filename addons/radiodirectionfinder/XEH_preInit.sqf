#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// Semi-public var:
GVAR(signalSourceFuncs) = [FUNC(getSignalsScripted), FUNC(getSignalsUAV)];
if (isClass (configFile >> "CfgPatches" >> "acre_sys_core")) then { GVAR(signalSourceFuncs) pushBack FUNC(getSignalsACRE); };

ADDON = true;
