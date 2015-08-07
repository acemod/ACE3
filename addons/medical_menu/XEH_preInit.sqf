#include "script_component.hpp"

ADDON = false;

PREP(onMenuOpen);
PREP(openMenu);

PREP(updateIcons);
PREP(updateUIInfo);
PREP(handleUI_DisplayOptions);
PREP(handleUI_dropDownTriageCard);
PREP(getTreatmentOptions);
PREP(updateActivityLog);
PREP(updateQuickViewLog);
PREP(updateBodyImage);
PREP(updateInformationLists);
PREP(setTriageStatus);
PREP(collectActions);

GVAR(INTERACTION_TARGET) = objNull;
GVAR(actionsOther) = [];
GVAR(actionsSelf) = [];
GVAR(selectedBodyPart) = 0;

call FUNC(collectActions);

ADDON = true;
