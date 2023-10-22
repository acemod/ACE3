#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(captivityEnabled) = false;

GVAR(restraints) = keys (uiNamespace getVariable QGVAR(restraints));
GVAR(blindfolds) = keys (uiNamespace getVariable QGVAR(blindfolds));

#include "initSettings.sqf"

ADDON = true;
