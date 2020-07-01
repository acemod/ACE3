
class CfgVehicles {
    class Man;
    class CAManBase: Man {
        // General
        class HitPoints {
            ADD_ACE_HITPOINTS(1,1);
        };
    };

    // BluFor
    class B_Soldier_base_F;
    class B_Soldier_04_f: B_Soldier_base_F {
        class HitPoints {
            ADD_ACE_HITPOINTS(2,2);
        };
    };
    class B_Soldier_05_f: B_Soldier_base_F {
        class HitPoints {
            ADD_ACE_HITPOINTS(2,2);
        };
    };

    // Indep
    class I_Soldier_base_F;
    class I_Soldier_03_F: I_Soldier_base_F {
        class HitPoints {
            ADD_ACE_HITPOINTS(2,2);
        };
    };
    class I_Soldier_04_F: I_Soldier_base_F {
        class HitPoints {
            ADD_ACE_HITPOINTS(2,2);
        };
    };

    // OpFor
    class SoldierEB;
    class O_Soldier_base_F: SoldierEB {
        class HitPoints {
            ADD_ACE_HITPOINTS(2,2);
        };
    };
    class O_Soldier_02_F: O_Soldier_base_F {
        class HitPoints {
            ADD_ACE_HITPOINTS(2,2);
        };
    };
    class O_officer_F: O_Soldier_base_F {
        class HitPoints {
            ADD_ACE_HITPOINTS(1,2);
        };
    };
    class O_Soldier_diver_base_F: O_Soldier_base_F {
        class HitPoints {
            ADD_ACE_HITPOINTS(1,1);
        };
    };

    // Virtual Reality
    class B_Soldier_VR_F: B_Soldier_base_F {
        class HitPoints {
            ADD_ACE_HITPOINTS(1,1);
        };
    };
    class B_Protagonist_VR_F: B_Soldier_base_F {
        class HitPoints {
            ADD_ACE_HITPOINTS(1,1);
        };
    };
    class O_Soldier_VR_F: O_Soldier_base_F {
        class HitPoints {
            ADD_ACE_HITPOINTS(1,1);
        };
    };
    class I_Soldier_VR_F: I_Soldier_base_F {
        class HitPoints {
            ADD_ACE_HITPOINTS(1,1);
        };
    };
    class I_Protagonist_VR_F: I_Soldier_base_F {
        class HitPoints {
            ADD_ACE_HITPOINTS(1,1);
        };
    };
    class O_Protagonist_VR_F: O_Soldier_base_F {
        class HitPoints {
            ADD_ACE_HITPOINTS(1,1);
        };
    };
    class C_man_1;
    class C_Protagonist_VR_F: C_man_1 {
        class HitPoints {
            ADD_ACE_HITPOINTS(1,1);
        };
    };

    // Civilians
    class C_Soldier_VR_F: C_man_1 {
        class HitPoints {
            ADD_ACE_HITPOINTS(1,1);
        };
    };

    // APEX
    class O_V_Soldier_Viper_F: O_Soldier_base_F {
        class HitPoints {
            ADD_ACE_HITPOINTS(3,3);
        };
    };
    class O_V_Soldier_base_F: O_Soldier_base_F {
        class HitPoints {
            ADD_ACE_HITPOINTS(3,3);
        };
    };

    // Enoch
    class I_E_Man_Base_F;
    class I_E_Uniform_01_coveralls_F: I_E_Man_Base_F {
        class HitPoints {
            ADD_ACE_HITPOINTS(2,2);
        };
    };
};
