#include "script_component.hpp"

ADDON = false;

PREP(getTypeOfDamage);
PREP(handleDamage_airway);
PREP(handleDamage);
PREP(handleDamage_advanced);
PREP(handleDamage_basic);
PREP(handleDamage_fractures);
PREP(handleDamage_internalInjuries);
PREP(handleDamage_caching);
PREP(init);
PREP(selectionNameToNumber);
PREP(handleDamage_wounds);
PREP(handleUnitVitals);
PREP(getBloodLoss);
PREP(getBloodPressure);
PREP(getBloodVolumeChange);
PREP(getCardiacOutput);
PREP(setCardiacArrest);
PREP(addToInjuredCollection);
PREP(setUnconscious);
PREP(getUnconsciousCondition);
PREP(addUnconsciousCondition);
PREP(setDead);
PREP(parseConfigForInjuries);
PREP(playInjuredSound);
PREP(treatment);
PREP(canTreat);
PREP(treatmentAdvanced_bandage);
PREP(treatmentAdvanced_bandageLocal);
PREP(treatmentAdvanced_medication);
PREP(treatmentAdvanced_medicationLocal);
PREP(teatmentIV);
PREP(treatmentIVLocal);
PREP(treatmentTourniquet);
PREP(treatmentTourniquetLocal);

GVAR(injuredUnitCollection) = [];
call FUNC(parseConfigForInjuries);

ADDON = true;
