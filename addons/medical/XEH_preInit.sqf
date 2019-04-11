#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

// Add warning for old functions that were technically public, Remove at 3.14.0
{
    missionNamespace setVariable [_x, compileFinal format ['diag_log text "ACE Medical WARNING: Formerly public function [%1] has no effect in medical rewrite."; nil', _x]];
} forEach ["ace_medical_fnc_actionPlaceInBodyBag","ace_medical_fnc_actionRemoveTourniquet","ace_medical_fnc_addHeartRateAdjustment","ace_medical_fnc_addToLog","ace_medical_fnc_addToTriageCard","ace_medical_fnc_addUnconsciousCondition","ace_medical_fnc_addVitalLoop","ace_medical_fnc_canAccessMedicalEquipment","ace_medical_fnc_canTreat","ace_medical_fnc_displayTriageCard","ace_medical_fnc_dropDownTriageCard","ace_medical_fnc_getTriageStatus","ace_medical_fnc_getUnconsciousCondition","ace_medical_fnc_hasItem","ace_medical_fnc_hasItems","ace_medical_fnc_hasTourniquetAppliedTo","ace_medical_fnc_isInMedicalFacility","ace_medical_fnc_isInMedicalVehicle","ace_medical_fnc_isMedic","ace_medical_fnc_isMedicalVehicle","ace_medical_fnc_itemCheck","ace_medical_fnc_selectionNameToNumber","ace_medical_fnc_setCardiacArrest","ace_medical_fnc_setDead","ace_medical_fnc_setHitPointDamage","ace_medical_fnc_showBloodEffect","ace_medical_fnc_treatment","ace_medical_fnc_treatmentAdvanced_bandage","ace_medical_fnc_treatmentAdvanced_CPR","ace_medical_fnc_treatmentAdvanced_CPRLocal","ace_medical_fnc_treatmentAdvanced_medication","ace_medical_fnc_treatmentAdvanced_medicationLocal","ace_medical_fnc_treatmentIV","ace_medical_fnc_treatmentIVLocal","ace_medical_fnc_unconsciousPFH","ace_medical_fnc_useItem","ace_medical_fnc_useItems"];

ADDON = true;
