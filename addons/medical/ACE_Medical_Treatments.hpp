
class ACE_Medical_Treatments {
    class ACE_Bandaging {
        // Which locations can this treatment action be used? Available: Field, MedicalFacility, MedicalVehicle, All.
        treatmentLocations[] = {"Field", "MedicalFacility", "MedicalVehicle"};
        // What is the level of medical skill required for this treatment action? 0 = all soldiers, 1 = medic, 2 = doctor
        requiredMedic = 0;
        // Available under which medical level settings? 0 = basic, 1 = advanced.
        availableLevels[] = {0, 1};
        // The time it takes for a treatment action to complete. Time is in seconds.
        treatmentTime = 5;
        // Item required for the action. Leave empty for no item required.
        items[] = {"ace_sampleItem"};
        // Callbacks
        callbackSuccess = "hint ""Success"";";
        callbackFailure = "hint ""Failure "";";
        onProgress = "";
        animationPatient = "";
        animationCaller = "";
    };
};
