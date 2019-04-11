#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

// Add warning for old functions that were technically public, Remove at 3.14.0
{
    missionNamespace setVariable [_x, compileFinal format ['diag_log text "ACE Medical WARNING: Formerly public function [%1] has no effect in medical rewrite."; nil', _x]];
} forEach [
    QFUNC(actionPlaceInBodyBag),
    QFUNC(actionRemoveTourniquet),
    QFUNC(addHeartRateAdjustment),
    QFUNC(addToLog),
    QFUNC(addToTriageCard),
    QFUNC(addUnconsciousCondition),
    QFUNC(addVitalLoop),
    QFUNC(canAccessMedicalEquipment),
    QFUNC(canTreat),
    QFUNC(displayTriageCard),
    QFUNC(dropDownTriageCard),
    QFUNC(getTriageStatus),
    QFUNC(getUnconsciousCondition),
    QFUNC(hasItem),
    QFUNC(hasItems),
    QFUNC(hasTourniquetAppliedTo),
    QFUNC(isInMedicalFacility),
    QFUNC(isInMedicalVehicle),
    QFUNC(isMedic),
    QFUNC(isMedicalVehicle),
    QFUNC(itemCheck),
    QFUNC(selectionNameToNumber),
    QFUNC(setCardiacArrest),
    QFUNC(setDead),
    QFUNC(setHitPointDamage),
    QFUNC(showBloodEffect),
    QFUNC(treatment),
    QFUNC(treatmentAdvanced_bandage),
    QFUNC(treatmentAdvanced_CPR),
    QFUNC(treatmentAdvanced_CPRLocal),
    QFUNC(treatmentAdvanced_medication),
    QFUNC(treatmentAdvanced_medicationLocal),
    QFUNC(treatmentIV),
    QFUNC(treatmentIVLocal),
    QFUNC(unconsciousPFH),
    QFUNC(useItem),
    QFUNC(useItems)
];

ADDON = true;
