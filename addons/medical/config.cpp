#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
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
#include "UI\CfgInGameUI.hpp"
#include "UI\RscTitles.hpp"
#include "UI\triagecard.hpp"

class ACE_newEvents {
    medical_onUnconscious = "ace_unconscious";
    medical_treatmentSuccess = "ace_treatmentSucceded";
    medical_onSetDead = "ace_killed";
    Medical_onEnteredCardiacArrest = "ace_cardiacArrestEntered";
    Medical_onItemAddedToTriageCard = "ace_triageCardItemAdded";
    medical_onLogEntryAdded = "ace_medicalLogEntryAdded";
    Medical_onHeartRateAdjustmentAdded = "ace_heartRateAdjustmentAdded";
    placedInBodyBag = "ace_placedInBodyBag";
    actionPlaceInBodyBag = QGVAR(actionPlaceInBodyBag);
    treatmentTourniquetLocal = QGVAR(treatmentTourniquetLocal);
    treatmentIVLocal = QGVAR(treatmentIVLocal);
    treatmentBasic_morphineLocal = QGVAR(treatmentBasic_morphineLocal);
    treatmentBasic_bloodbagLocal = QGVAR(treatmentBasic_bloodbagLocal);
    treatmentAdvanced_medicationLocal = QGVAR(treatmentAdvanced_medicationLocal);
    treatmentAdvanced_fullHealLocal = QGVAR(treatmentAdvanced_fullHealLocal);
    treatmentAdvanced_CPRLocal = QGVAR(treatmentAdvanced_CPRLocal);
    treatmentAdvanced_bandageLocal = QGVAR(treatmentAdvanced_bandageLocal);
    setUnconscious = QGVAR(setUnconscious);
    setHitPointDamage = QGVAR(setHitPointDamage);
    setDead = QGVAR(setDead);
    addToTriageCard = QGVAR(addToTriageCard);
    addToMedicalLog = QGVAR(addToMedicalLog);
    actionCheckPulseLocal = QGVAR(actionCheckPulseLocal);
    actionCheckBloodPressureLocal = QGVAR(actionCheckBloodPressureLocal);
    addVitalLoop = QGVAR(addVitalLoop);
};
