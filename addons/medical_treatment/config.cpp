#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_medical"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Glowbal", "KoffeinFlummi"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgActions.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "ACE_Medical_Treatments.hpp"
#include "ACE_Settings.hpp"

// TODO validate and check
class ACE_newEvents {
    medical_treatmentSuccess = "ace_treatmentSuccess";
    Medical_onItemAddedToTriageCard = "ace_itemAddedToTriageCard";
    medical_onLogEntryAdded = "ace_medicalLogEntryAdded";
    Medical_onHeartRateAdjustmentAdded = "ace_addedHeartRateAdjustment";
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

    addToTriageCard = QGVAR(addToTriageCard);
    addToMedicalLog = QGVAR(addToMedicalLog);
    actionCheckPulseLocal = QGVAR(actionCheckPulseLocal);
    actionCheckBloodPressureLocal = QGVAR(actionCheckBloodPressureLocal);
};
