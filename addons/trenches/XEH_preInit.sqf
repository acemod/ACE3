#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

GVAR(entrenchingTools) = keys (uiNamespace getVariable QGVAR(entrenchingTools));

ADDON = true;