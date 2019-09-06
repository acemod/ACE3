#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

// Semi-public var:
GVAR(signalSourceFuncs) = [LINKFUNC(getSignalsScripted)];

ADDON = true;
