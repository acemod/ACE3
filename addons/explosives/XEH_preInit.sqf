/*
Name: XEH_preInit.sqf

Author(s):
Garth de Wet (LH)

Description:
Prepares the functions

Parameters:
None

Returns:
None

Example:
None
*/
#include "script_component.hpp"

ADDON = false;

PREP(addClacker);
PREP(canDefuse);
PREP(canDetonate);
PREP(defuseExplosive);
PREP(detonateExplosive);

PREP(handleScrollWheel);

PREP(hasExplosives);
PREP(hasPlacedExplosives);

PREP(getDetonators);
PREP(getPlacedExplosives);

PREP(openDetonateUI);
PREP(openPlaceUI);
PREP(openTransmitterUI);
PREP(openTimerSetUI);
PREP(openTriggerSelectionUI);

PREP(place_Approve);
PREP(place_Cancel);

PREP(placeExplosive);

PREP(selectTrigger);
PREP(setupExplosive);
PREP(setPosition);
PREP(startDefuse);
PREP(startTimer);
PREP(triggerType);

ADDON = true;
