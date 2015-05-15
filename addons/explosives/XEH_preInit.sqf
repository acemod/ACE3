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

PREP(getDetonators);
PREP(getPlacedExplosives);
PREP(getSpeedDialExplosive);

PREP(module);

PREP(onLanded);

PREP(openTimerSetUI);

PREP(place_Approve);
PREP(place_Cancel);

PREP(placeExplosive);
PREP(removeFromSpeedDial);

PREP(selectTrigger);
PREP(setupExplosive);
PREP(setPosition);
PREP(setSpeedDial);
PREP(startDefuse);
PREP(startTimer);
PREP(triggerType);

PREP(canDaisyChainTo);
PREP(checkDaisyChain);
PREP(daisyChainTo);
PREP(detonateDaisyChain);
PREP(endDaisyChain);
PREP(isDaisyChaining);
PREP(startDaisyChain);
PREP(stopDaisyChain);

ADDON = true;
