#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(INTERACTION_TARGET) = objNull;
GVAR(actionsOther) = [];
GVAR(actionsSelf) = [];
GVAR(selectedBodyPart) = 0;

call FUNC(collectActions);

ADDON = true;
