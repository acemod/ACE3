/*
 * Author: Garth 'L-H' de Wet
 * Initialises the explosives system
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

ADDON = false;

PREP(addCellphoneIED);
PREP(addClacker);
PREP(addDetonateActions);
PREP(addExplosiveActions);
PREP(addToSpeedDial);
PREP(addTransmitterActions);
PREP(addTriggerActions);
PREP(canDefuse);
PREP(canDetonate);
PREP(defuseExplosive);
PREP(detonateExplosive);
PREP(dialPhone);
PREP(dialingPhone);

PREP(handleScrollWheel);

PREP(hasExplosives);
PREP(hasPlacedExplosives);

PREP(interactEH);

PREP(getDetonators);
PREP(getPlacedExplosives);
PREP(getSpeedDialExplosive);

PREP(module);

PREP(onIncapacitated);
PREP(onInventoryChanged);

PREP(openTimerSetUI);

PREP(placeExplosive);
PREP(removeFromSpeedDial);

PREP(selectTrigger);
PREP(setupExplosive);
PREP(setPosition);
PREP(setSpeedDial);
PREP(startDefuse);
PREP(startTimer);
PREP(triggerType);

ADDON = true;
