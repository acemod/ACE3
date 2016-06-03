#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_medicalSupplyCrate", "ACE_medicalSupplyCrate_advanced", "ACE_fieldDressingItem", "ACE_packingBandageItem", "ACE_elasticBandageItem", "ACE_tourniquetItem", "ACE_morphineItem", "ACE_atropineItem", "ACE_epinephrineItem", "ACE_plasmaIVItem", "ACE_bloodIVItem", "ACE_salineIVItem", "ACE_quikclotItem", "ACE_personalAidKitItem", "ACE_surgicalKitItem", "ACE_bodyBagItem", "ACE_bodyBagObject"};
        weapons[] = {"ACE_fieldDressing", "ACE_packingBandage", "ACE_elasticBandage", "ACE_tourniquet", "ACE_morphine", "ACE_atropine", "ACE_epinephrine", "ACE_plasmaIV", "ACE_plasmaIV_500", "ACE_plasmaIV_250", "ACE_bloodIV", "ACE_bloodIV_500", "ACE_bloodIV_250", "ACE_salineIV", "ACE_salineIV_500", "ACE_salineIV_250", "ACE_quikclot", "ACE_personalAidKit", "ACE_surgicalKit", "ACE_bodyBag"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction", "ace_apl"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Glowbal", "KoffeinFlummi"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgActions.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgFactionClasses.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgSounds.hpp"
#include "CfgEden.hpp"
#include "ACE_Medical_Treatments.hpp"
#include "ACE_Settings.hpp"
#include "UI\RscTitles.hpp"
#include "UI\triagecard.hpp"

class ACE_newEvents {
    medical_onUnconscious = QGVAR(unconscious);
    medical_treatmentSuccess = QGVAR(treatmentSuccess);
    medical_onSetDead = QGVAR(killed);
    Medical_onEnteredCardiacArrest = QGVAR(enteredCardiacArrest);
    Medical_onItemAddedToTriageCard = QGVAR(itemAddedToTriageCard);
    medical_onLogEntryAdded = QGVAR(logEntryAdded);
    Medical_onHeartRateAdjustmentAdded = QGVAR(addedHeartRateAdjustment);
    placedInBodyBag = QGVAR(playedInBodyBag);
    actionPlaceInBodyBag = "ace_actionPlaceInBodyBag";
    treatmentTourniquetLocal = "ace_treatmentTourniquetLocal";
    treatmentIVLocal = "ace_treatmentIVLocal";
    treatmentBasic_morphineLocal = "ace_treatmentBasic_morphineLocal";
    treatmentBasic_bloodbagLocal = "ace_treatmentBasic_bloodbagLocal";
    treatmentBasic_bandageLocal = "ace_treatmentBasic_bandageLocal";
    treatmentAdvanced_medicationLocal = "ace_treatmentAdvanced_medicationLocal";
    treatmentAdvanced_fullHealLocal = "ace_treatmentAdvanced_fullHealLocal";
    treatmentAdvanced_CPRLocal = "ace_treatmentAdvanced_CPRLocal";
    treatmentAdvanced_bandageLocal = "ace_treatmentAdvanced_bandageLocal";
    setUnconscious = "ace_setUnconscious";
    setHitPointDamage = "ace_setHitPointDamage";
    setDead = "ace_setDead";
    addToTriageCard = "ace_addToTriageCard";
    addToMedicalLog = "ace_addToMedicalLog";
    addToInjuredCollection = "ace_addToInjuredCollection";
    actionCheckPulseLocal = "ace_actionCheckPulseLocal";
    actionCheckBloodPressureLocal = "ace_actionCheckBloodPressureLocal";
    addVitalLoop = "ace_addVitalLoop";
};
