
class CfgVehicles {
    class Man;
    class CAManBase: Man {
        // General
        class HitPoints {
            class HitHands;
            class HitLegs;
            ADD_ACE_HITPOINTS;
        };
    };

    // BluFor
    class B_Soldier_base_F;
    class B_Soldier_04_f: B_Soldier_base_F {
        class HitPoints {
            class HitHands;
            class HitLegs;
            ADD_ACE_HITPOINTS;
        };
    };
    class B_Soldier_05_f: B_Soldier_base_F {
        class HitPoints {
            class HitHands;
            class HitLegs;
            ADD_ACE_HITPOINTS;
        };
    };

    // Indep
    class I_Soldier_base_F;
    class I_Soldier_03_F: I_Soldier_base_F {
        class HitPoints {
            class HitHands;
            class HitLegs;
            ADD_ACE_HITPOINTS;
        };
    };
    class I_Soldier_04_F: I_Soldier_base_F {
        class HitPoints {
            class HitHands;
            class HitLegs;
            ADD_ACE_HITPOINTS;
        };
    };

    // OpFor
    class SoldierEB;
    class O_Soldier_base_F: SoldierEB {
        class HitPoints {
            class HitHands;
            class HitLegs;
            ADD_ACE_HITPOINTS;
        };
    };
    class O_Soldier_02_F: O_Soldier_base_F {
        class HitPoints {
            class HitHands;
            class HitLegs;
            ADD_ACE_HITPOINTS;
        };
    };
    class O_officer_F: O_Soldier_base_F {
        class HitPoints {
            class HitHands;
            class HitLegs;
            ADD_ACE_HITPOINTS;
        };
    };
    class O_Soldier_diver_base_F: O_Soldier_base_F {
        class HitPoints {
            class HitHands;
            class HitLegs;
            ADD_ACE_HITPOINTS;
        };
    };

    // Virtual Reality
    class B_Soldier_VR_F: B_Soldier_base_F {
        class HitPoints {
            class HitHands;
            class HitLegs;
            ADD_ACE_HITPOINTS;
        };
    };
    class B_Protagonist_VR_F: B_Soldier_base_F {
        class HitPoints {
            class HitHands;
            class HitLegs;
            ADD_ACE_HITPOINTS;
        };
    };
    class O_Soldier_VR_F: O_Soldier_base_F {
        class HitPoints {
            class HitHands;
            class HitLegs;
            ADD_ACE_HITPOINTS;
        };
    };
    class I_Soldier_VR_F: I_Soldier_base_F {
        class HitPoints {
            class HitHands;
            class HitLegs;
            ADD_ACE_HITPOINTS;
        };
    };
    class I_Protagonist_VR_F: I_Soldier_base_F {
        class HitPoints {
            class HitHands;
            class HitLegs;
            ADD_ACE_HITPOINTS;
        };
    };
    class O_Protagonist_VR_F: O_Soldier_base_F {
        class HitPoints {
            class HitHands;
            class HitLegs;
            ADD_ACE_HITPOINTS;
        };
    };
    class C_man_1;
    class C_Protagonist_VR_F: C_man_1 {
        class HitPoints {
            class HitHands;
            class HitLegs;
            ADD_ACE_HITPOINTS;
        };
    };

    // Civilians
    class C_Soldier_VR_F: C_man_1 {
        class HitPoints {
            class HitHands;
            class HitLegs;
            ADD_ACE_HITPOINTS;
        };
    };

    // APEX
    class O_V_Soldier_Viper_F: O_Soldier_base_F {
        class HitPoints {
            class HitHands;
            class HitLegs;
            ADD_ACE_HITPOINTS;
        };
    };
    class O_V_Soldier_base_F: O_Soldier_base_F {
        class HitPoints {
            class HitHands;
            class HitLegs;
            ADD_ACE_HITPOINTS;
        };
    };

    // Enoch
    class I_E_Man_Base_F;
    class I_E_Uniform_01_coveralls_F: I_E_Man_Base_F {
        class HitPoints {
            class HitHands;
            class HitLegs;
            ADD_ACE_HITPOINTS;
        };
    };
};
