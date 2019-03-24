#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

GVAR(INTERACTION_TARGET) = objNull;
GVAR(actionsOther) = [];
GVAR(actionsSelf) = [];
GVAR(selectedBodyPart) = 0;

call FUNC(collectActions);

ADDON = true;
