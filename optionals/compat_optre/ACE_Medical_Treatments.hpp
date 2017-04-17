
class ACE_Medical_Actions {
    class Basic {
        class Bandage;
        class Biofoam: Bandage {
            displayName = "Biofoam";
            displayNameProgress = "Applying Biofoam...";
            category = "Advanced";
            treatmentTime = 12;
            items[] = {{"OPTRE_Biofoam"}};
            itemConsumed = 1;

            callbackSuccess = QUOTE(FUNC(treatment_Biofoam));
            callbackFailure = "";
            callbackProgress = "";

            animationPatient = "";
            animationCaller = "AinvPknlMstpSlayWrflDnon_medic1";
            litter[] = {};
        };
    };

    class Advanced {
        class Biofoam {
            displayName = "Biofoam";
            displayNameProgress = "Applying Biofoam...";
            category = "Advanced";
            // Which locations can this treatment action be used? Available: Field, MedicalFacility, MedicalVehicle, All.
            treatmentLocations[] = {"All"};
            allowedSelections[] = {"All"};
            allowSelfTreatment = 1;
            // What is the level of medical skill required for this treatment action? 0 = all soldiers, 1 = medic, 2 = doctor
            requiredMedic = 0;
            // The time it takes for a treatment action to complete. Time is in seconds.
            treatmentTime = 12;
            // Item required for the action. Leave empty for no item required.
            items[] = {"OPTRE_Biofoam"};
            condition = "";
            patientStateCondition = 0;
            // Callbacks
            callbackSuccess = QUOTE(EFUNC(medical,treatmentAdvanced_fullHeal)); //TODO: Change function
            callbackFailure = "";
            callbackProgress = "";
            itemConsumed = 1;
            animationPatient = "";
            animationPatientUnconscious = "AinjPpneMstpSnonWrflDnon_rolltoback";
            animationPatientUnconsciousExcludeOn[] = {"ainjppnemstpsnonwrfldnon"};
            animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
            animationCallerProne = "AinvPpneMstpSlayW[wpn]Dnon_medicOther";
            animationCallerSelf = "AinvPknlMstpSlayW[wpn]Dnon_medic";
            animationCallerSelfProne = "AinvPpneMstpSlayW[wpn]Dnon_medic";
            litter[] = {};
        };
    };
};

