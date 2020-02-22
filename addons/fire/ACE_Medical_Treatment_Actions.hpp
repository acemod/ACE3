class ace_medical_treatment_actions {
    class BasicBandage;
    class PatDown: BasicBandage {
        displayName = CSTRING(Actions_PatDown);
        displayNameProgress = CSTRING(Actions_PerformingPatDown);
        icon = "";
        category = "advanced";
        treatmentLocations = 0;
        allowedSelections[] = {"All"};
        allowSelfTreatment = 1;
        medicRequired = 0;
        treatmentTime = 5;
        items[] = {};
        condition = QFUNC(medical_canPatDown);
        callbackSuccess = QFUNC(medical_success);
        callbackProgress = QFUNC(medical_progress);
        consumeItem = 0;
        litter[] = {};
    };
};