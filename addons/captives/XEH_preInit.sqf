#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(captivityEnabled) = false;

GVAR(restraints) = call (uiNamespace getVariable QGVAR(restraints));

#include "initSettings.sqf"

ADDON = true;
