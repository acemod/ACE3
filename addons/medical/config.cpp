#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_medicalSupplyCrate", "ACE_medicalSupplyCrate_advanced", "ACE_fieldDressingItem", "ACE_packingBandageItem", "ACE_elasticBandageItem", "ACE_tourniquetItem", "ACE_morphineItem", "ACE_atropineItem", "ACE_epinephrineItem", "ACE_plasmaIVItem", "ACE_bloodIVItem", "ACE_salineIVItem", "ACE_quikclotItem", "ACE_personalAidKitItem", "ACE_surgicalKitItem", "ACE_bodyBagItem", "ACE_bodyBagObject"};
        weapons[] = {"ACE_fieldDressing", "ACE_packingBandage", "ACE_elasticBandage", "ACE_tourniquet", "ACE_morphine", "ACE_atropine", "ACE_epinephrine", "ACE_plasmaIV", "ACE_plasmaIV_500", "ACE_plasmaIV_250", "ACE_bloodIV", "ACE_bloodIV_500", "ACE_bloodIV_250", "ACE_salineIV", "ACE_salineIV_500", "ACE_salineIV_250", "ACE_quikclot", "ACE_personalAidKit", "ACE_surgicalKit", "ACE_bodyBag"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction", "ace_apl"};
        author[] = {"Glowbal", "KoffeinFlummi"};
        authorUrl = "";
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
    medical_onUnconscious = "ace_medical_onUnconscious";
    playerInventoryChanged = "ace_playerInventoryChanged";
    placedInBodyBag = "ace_placedInBodyBag";
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
    interactMenuClosed = "ace_interactMenuClosed";
    medical_woundUpdateRequest = "ace_medical_woundUpdateRequest";
    medical_propagateWound = "ace_medical_propagateWound";
    useItem = "ace_useItem";
    medical_treatmentSuccess = "ace_medical_treatmentSuccess";
    displayTextStructured = "ace_displayTextStructured";
    medical_onSetDead = "ace_medical_onSetDead";
    Medical_onEnteredCardiacArrest = "ace_medical_onEnteredCardiacArrest";
    hideObjectGlobal = "ace_hideObjectGlobal";
    addVitalLoop = "ace_addVitalLoop";
    Medical_onItemAddedToTriageCard = "ace_medical_onItemAddedToTriageCard";
    medical_onLogEntryAdded = "ace_medical_onLogEntryAdded";
    Medical_onHeartRateAdjustmentAdded = "ace_medical_onHeartRateAdjustmentAdded";
    unloadPersonEvent = "ace_unloadPersonEvent";
};
