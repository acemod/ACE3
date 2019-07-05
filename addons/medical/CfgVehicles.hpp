class CfgVehicles {
    // Backwards compatibility
    // Left as dumb modules so that old missions don't error about missing vehicles
    class Logic;
    class Module_F: Logic {
        class EventHandlers;
    };
    class ACE_moduleMedicalSettings: Module_F {
        author = ECSTRING(common,ACETeam);
        scope = 1;
        displayName = "[ACE] Retired Medical module (will have no effect)";
        class EventHandlers: EventHandlers {
            init = "diag_log text format ['[ACE] (Medical) Warning retired module [%1] placed (will have no effect)', typeOf (_this select 0)];";
        };
    };
    class ACE_moduleBasicMedicalSettings: ACE_moduleMedicalSettings {};
    class ACE_moduleAdvancedMedicalSettings: ACE_moduleMedicalSettings {};
    class ACE_moduleReviveSettings: ACE_moduleMedicalSettings {};
    class ACE_moduleAssignMedicRoles: ACE_moduleMedicalSettings {};
    class ACE_moduleAssignMedicVehicle: ACE_moduleMedicalSettings {};
    class ACE_moduleAssignMedicalFacility: ACE_moduleMedicalSettings {};
    class ACE_moduleMedicalMenuSettings: ACE_moduleMedicalSettings {};
};
