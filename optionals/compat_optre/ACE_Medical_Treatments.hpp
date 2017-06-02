
class ACE_Medical_Actions {
    class Basic {
        class Bandage;
        class Biofoam: Bandage {
            displayName = CSTRING(Biofoam);
            displayNameProgress = CSTRING(BiofoamApply);
            category = "Advanced";
            treatmentTime = 12;
            items[] = {{"OPTRE_Biofoam"}};
            itemConsumed = 1;

            callbackSuccess = QUOTE(DFUNC(treatment_Biofoam));
            callbackFailure = "";
            callbackProgress = "";

            animationPatient = "";
            animationCaller = "AinvPknlMstpSlayWrflDnon_medic1";
            litter[] = {};
        };
    };

    class Advanced {
        class Biofoam {
            displayName = CSTRING(Biofoam);
            displayNameProgress = CSTRING(BiofoamApply);
            category = "Advanced";
            treatmentLocations[] = {"All"};
            allowedSelections[] = {"All"};
            allowSelfTreatment = 1;
            requiredMedic = 0;
            treatmentTime = 12;
            items[] = {"OPTRE_Biofoam"};
            condition = "";
            patientStateCondition = 0;
            callbackSuccess = QUOTE(DEFUNC(medical,treatmentAdvanced_fullHeal));
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
